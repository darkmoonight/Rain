package com.yoshi.rain.widget

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.PorterDuff
import android.os.Build
import android.util.Log
import android.view.View
import android.widget.RemoteViews
import androidx.annotation.ColorInt
import androidx.annotation.DimenRes
import androidx.annotation.DrawableRes
import androidx.annotation.IdRes
import androidx.core.content.ContextCompat
import androidx.core.graphics.drawable.DrawableCompat
import com.yoshi.rain.R

object WidgetIconHelper {
    private const val TAG = "WidgetIconHelper"

    /** Decodes a cached icon file and sets it on a widget [RemoteViews] image slot. */
    fun setIcon(views: RemoteViews, viewId: Int, path: String?) {
        if (path.isNullOrEmpty()) return
        try {
            android.graphics.BitmapFactory.decodeFile(path)?.let {
                views.setImageViewBitmap(viewId, it)
            }
        } catch (t: Throwable) {
            Log.w(TAG, "Failed to decode icon: $path", t)
        }
    }

    /** Applies custom or default widget background and text colors. */
    fun applyColors(
        context: Context,
        views: RemoteViews,
        @IdRes backgroundViewId: Int,
        @DrawableRes shapeDrawable: Int,
        settings: WidgetSettings,
        textIds: IntArray,
        @DimenRes widthDimen: Int = R.dimen.widget_material_you_default_size,
        @DimenRes heightDimen: Int = R.dimen.widget_material_you_default_size,
    ) {
        if (settings.themeMode == "system" && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            applyDualToneColors(views, backgroundViewId, shapeDrawable, settings, textIds)
            return
        }
        applyFixedPaletteColors(
            context,
            views,
            backgroundViewId,
            shapeDrawable,
            settings,
            textIds,
            widthDimen,
            heightDimen,
        )
    }

    /**
     * API 31+ with app theme `system`: launcher switches light/dark colors on its own.
     * Both palette slots are always set so resetting custom colors overwrites old tints.
     */
    private fun applyDualToneColors(
        views: RemoteViews,
        @IdRes backgroundViewId: Int,
        @DrawableRes shapeDrawable: Int,
        settings: WidgetSettings,
        textIds: IntArray,
    ) {
        val (lightBg, darkBg) = resolveBackgroundColors(settings)
        if (isFullyTransparent(lightBg) && isFullyTransparent(darkBg)) {
            setBackgroundVisible(views, backgroundViewId, visible = false)
            return
        }
        setBackgroundVisible(views, backgroundViewId, visible = true)
        try {
            views.setImageViewResource(backgroundViewId, tintableDrawable(shapeDrawable))
            views.setColorInt(backgroundViewId, "setColorFilter", lightBg, darkBg)
        } catch (e: Exception) {
            Log.w(TAG, "Failed to apply dual-tone widget background", e)
        }

        val (lightText, darkText) = resolveTextColors(settings)
        try {
            textIds.forEach { views.setColorInt(it, "setTextColor", lightText, darkText) }
        } catch (e: Exception) {
            Log.w(TAG, "Failed to apply dual-tone widget text colors", e)
        }
    }

    /** Fixed app or system palette when dual-tone RemoteViews APIs are unavailable. */
    private fun applyFixedPaletteColors(
        context: Context,
        views: RemoteViews,
        @IdRes backgroundViewId: Int,
        @DrawableRes shapeDrawable: Int,
        settings: WidgetSettings,
        textIds: IntArray,
        @DimenRes widthDimen: Int,
        @DimenRes heightDimen: Int,
    ) {
        val customBackground =
            parseColorOrNull(
                if (settings.useDarkPalette) {
                    settings.backgroundColorDark
                } else {
                    settings.backgroundColorLight
                },
            )
        val customText =
            parseColorOrNull(
                if (settings.useDarkPalette) settings.textColorDark else settings.textColorLight,
            )

        applyShapeBackground(
            context,
            views,
            backgroundViewId,
            shapeDrawable,
            customBackground,
            widthDimen,
            heightDimen,
        )

        val textColor = customText ?: WidgetDefaults.textColor(context)
        try {
            textIds.forEach { views.setTextColor(it, textColor) }
        } catch (_: Exception) {
        }
    }

    private fun resolveBackgroundColors(settings: WidgetSettings): Pair<Int, Int> =
        Pair(
            parseColorOrNull(settings.backgroundColorLight) ?: WidgetDefaults.BG_LIGHT,
            parseColorOrNull(settings.backgroundColorDark) ?: WidgetDefaults.BG_DARK,
        )

    private fun resolveTextColors(settings: WidgetSettings): Pair<Int, Int> =
        Pair(
            parseColorOrNull(settings.textColorLight) ?: WidgetDefaults.TEXT_LIGHT,
            parseColorOrNull(settings.textColorDark) ?: WidgetDefaults.TEXT_DARK,
        )

    @DrawableRes
    private fun tintableDrawable(@DrawableRes shapeDrawable: Int): Int =
        when (shapeDrawable) {
            R.drawable.widget_m3_current_background ->
                R.drawable.widget_m3_current_background_tint
            R.drawable.widget_m3_background -> R.drawable.widget_m3_background_tint
            else -> shapeDrawable
        }

    private fun applyShapeBackground(
        context: Context,
        views: RemoteViews,
        @IdRes backgroundViewId: Int,
        @DrawableRes shapeDrawable: Int,
        @ColorInt customColor: Int?,
        @DimenRes widthDimen: Int,
        @DimenRes heightDimen: Int,
    ) {
        try {
            if (customColor != null && isFullyTransparent(customColor)) {
                setBackgroundVisible(views, backgroundViewId, visible = false)
                return
            }
            setBackgroundVisible(views, backgroundViewId, visible = true)
            views.setImageViewResource(backgroundViewId, shapeDrawable)
            if (customColor != null) {
                views.setImageViewBitmap(
                    backgroundViewId,
                    tintedShapeBitmap(context, shapeDrawable, customColor, widthDimen, heightDimen),
                )
            }
        } catch (e: Exception) {
            Log.w(TAG, "Failed to apply widget background", e)
        }
    }

    private fun setBackgroundVisible(
        views: RemoteViews,
        @IdRes backgroundViewId: Int,
        visible: Boolean,
    ) {
        views.setViewVisibility(
            backgroundViewId,
            if (visible) View.VISIBLE else View.GONE,
        )
    }

    private fun isFullyTransparent(@ColorInt color: Int): Boolean = Color.alpha(color) == 0

    private fun tintedShapeBitmap(
        context: Context,
        @DrawableRes drawableRes: Int,
        @ColorInt color: Int,
        widthDimen: Int,
        heightDimen: Int,
    ): Bitmap {
        val drawable =
            ContextCompat.getDrawable(context, drawableRes)
                ?.constantState
                ?.newDrawable()
                ?.mutate()
                ?: throw IllegalArgumentException("Missing drawable $drawableRes")
        DrawableCompat.setTintList(drawable, null)
        DrawableCompat.setTintMode(drawable, PorterDuff.Mode.SRC_IN)
        DrawableCompat.setTint(drawable, color)

        val width = context.resources.getDimensionPixelSize(widthDimen)
        val height = context.resources.getDimensionPixelSize(heightDimen)
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        drawable.setBounds(0, 0, width, height)
        drawable.draw(canvas)
        return bitmap
    }

    private fun parseColorOrNull(hex: String?): Int? {
        if (hex.isNullOrBlank()) return null
        return try {
            Color.parseColor(hex)
        } catch (_: IllegalArgumentException) {
            null
        }
    }
}
