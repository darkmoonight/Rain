package com.yoshi.rain

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.res.Configuration
import android.graphics.BitmapFactory
import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin
import es.antonborri.home_widget.HomeWidgetProvider

class OreoWidget : HomeWidgetProvider() {

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: Bundle,
    ) {
        updateWidget(
            context,
            appWidgetManager,
            appWidgetId,
            HomeWidgetPlugin.getData(context),
            newOptions,
        )
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        appWidgetIds.forEach { appWidgetId ->
            updateWidget(context, appWidgetManager, appWidgetId, widgetData, null)
        }
    }

    private fun updateWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        widgetData: SharedPreferences,
        options: Bundle?,
    ) {
        try {
            val opts = options ?: appWidgetManager.getAppWidgetOptions(appWidgetId)
            val (widthDp, heightDp) = currentSizeDp(context, opts)
            val layoutId = layoutForSize(widthDp, heightDp)
            val views = RemoteViews(context.packageName, layoutId).apply {
                bindCommon(context, layoutId, widgetData, widthDp)
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        } catch (t: Throwable) {
            Log.e(TAG, "Failed to update widget $appWidgetId", t)
            appWidgetManager.updateAppWidget(
                appWidgetId,
                RemoteViews(context.packageName, R.layout.oreo_widget_bar_flat).apply {
                    bindCommon(context, R.layout.oreo_widget_bar_flat, widgetData, 250)
                },
            )
        }
    }

    private fun currentSizeDp(context: Context, options: Bundle): Pair<Int, Int> {
        val minW = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH, 250)
        val minH = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT, 40)
        val maxW = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MAX_WIDTH, minW)
        val maxH = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MAX_HEIGHT, minH)
        val landscape =
            context.resources.configuration.orientation == Configuration.ORIENTATION_LANDSCAPE
        return if (landscape) Pair(maxW, maxH) else Pair(minW, minH)
    }

    private fun layoutForSize(widthDp: Int, heightDp: Int): Int = when (shapeFor(widthDp, heightDp)) {
        WidgetShape.COMPACT -> R.layout.oreo_widget_compact
        WidgetShape.CARD -> R.layout.oreo_widget_card
        WidgetShape.BAR_FLAT -> R.layout.oreo_widget_bar_flat
        WidgetShape.BAR -> R.layout.oreo_widget_bar
    }

    private fun shapeFor(widthDp: Int, heightDp: Int): WidgetShape {
        if (widthDp < WIDTH_COMPACT_DP) {
            return WidgetShape.COMPACT
        }
        if (isSquareWidget(widthDp, heightDp)) {
            return WidgetShape.CARD
        }
        if (heightDp >= HEIGHT_BAR_STACKED_DP) {
            return WidgetShape.BAR
        }
        return WidgetShape.BAR_FLAT
    }

    private fun isSquareWidget(widthDp: Int, heightDp: Int): Boolean {
        if (widthDp < WIDTH_CARD_MIN_DP || heightDp < HEIGHT_CARD_MIN_DP) {
            return false
        }
        val ratio = widthDp.toFloat() / heightDp
        return ratio in SQUARE_RATIO_MIN..SQUARE_RATIO_MAX
    }

    private fun RemoteViews.bindCommon(
        context: Context,
        layoutId: Int,
        widgetData: SharedPreferences,
        widthDp: Int,
    ) {
        val pendingIntentFlags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        } else {
            PendingIntent.FLAG_UPDATE_CURRENT
        }
        setOnClickPendingIntent(
            R.id.widget_day_oreo,
            PendingIntent.getActivity(
                context,
                0,
                Intent(context, MainActivity::class.java),
                pendingIntentFlags,
            ),
        )

        val image = widgetData.getString("weather_icon", null)
        if (!image.isNullOrEmpty()) {
            try {
                BitmapFactory.decodeFile(image)?.let { setImageViewBitmap(R.id.widget_day_icon, it) }
            } catch (t: Throwable) {
                Log.w(TAG, "Could not decode widget icon: $image", t)
            }
        }

        setTextViewText(R.id.widget_day_title, widgetData.getString("weather_degree", null) ?: "--°")

        widgetData.getString("background_color", null)?.let { hex ->
            try {
                setInt(R.id.widget_day_oreo, "setBackgroundColor", Color.parseColor(hex))
            } catch (_: IllegalArgumentException) {
            }
        }

        widgetData.getString("text_color", null)?.let { hex ->
            try {
                val color = Color.parseColor(hex)
                setTextColor(R.id.widget_day_title, color)
                if (hasClock(layoutId)) {
                    setTextColor(R.id.widget_day_time, color)
                }
            } catch (_: IllegalArgumentException) {
            }
        }

        if (hasClock(layoutId)) {
            applyClockTimeFormat(
                context = context,
                timeformat = widgetData.getString("timeformat", "24"),
                layoutId = layoutId,
                widthDp = widthDp,
            )
        }
    }

    private fun hasClock(layoutId: Int): Boolean =
        layoutId == R.layout.oreo_widget_bar ||
            layoutId == R.layout.oreo_widget_bar_flat ||
            layoutId == R.layout.oreo_widget_card

    private fun RemoteViews.applyClockTimeFormat(
        context: Context,
        timeformat: String?,
        layoutId: Int,
        widthDp: Int,
    ) {
        val use12Hour = timeformat == "12"
        val patternRes = when {
            layoutId == R.layout.oreo_widget_card -> if (use12Hour) {
                R.string.date_format_widget_oreo_big_12
            } else {
                R.string.date_format_widget_oreo_big_24
            }
            layoutId == R.layout.oreo_widget_bar_flat ||
                widthDp < WIDTH_NARROW_BAR_DP -> if (use12Hour) {
                R.string.date_format_widget_oreo_compact_12
            } else {
                R.string.date_format_widget_oreo_compact_24
            }
            else -> if (use12Hour) {
                R.string.date_format_widget_oreo_12
            } else {
                R.string.date_format_widget_oreo_24
            }
        }
        val pattern = context.getString(patternRes)
        setCharSequence(R.id.widget_day_time, "setFormat12Hour", pattern)
        setCharSequence(R.id.widget_day_time, "setFormat24Hour", pattern)
    }

    private enum class WidgetShape {
        COMPACT,
        BAR_FLAT,
        BAR,
        CARD,
    }

    companion object {
        private const val TAG = "OreoWidget"
        private const val WIDTH_COMPACT_DP = 110
        private const val HEIGHT_BAR_STACKED_DP = 68
        private const val WIDTH_CARD_MIN_DP = 110
        private const val HEIGHT_CARD_MIN_DP = 110
        private const val SQUARE_RATIO_MIN = 0.78f
        private const val SQUARE_RATIO_MAX = 1.28f
        private const val WIDTH_NARROW_BAR_DP = 220
    }
}
