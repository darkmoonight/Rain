package com.yoshi.rain.widget

import androidx.annotation.ColorInt
import com.yoshi.rain.R
import androidx.core.content.ContextCompat
import android.content.Context

/** Default widget colors aligned with `values/colors.xml` and `values-night/colors.xml`. */
object WidgetDefaults {
    /** Light-theme widget background when no custom color is saved. */
    @ColorInt const val BG_LIGHT: Int = 0xFFF0F4F8.toInt()

    /** Dark-theme widget background when no custom color is saved. */
    @ColorInt const val BG_DARK: Int = 0xFF1A1C1E.toInt()

    /** Light-theme widget text color when no custom color is saved. */
    @ColorInt const val TEXT_LIGHT: Int = 0xFF1A1C1E.toInt()

    /** Dark-theme widget text color when no custom color is saved. */
    @ColorInt const val TEXT_DARK: Int = 0xFFE2E2E6.toInt()

    /** Resolves the themed text color from widget resources. */
    fun textColor(context: Context): Int =
        ContextCompat.getColor(context, R.color.widget_text)
}
