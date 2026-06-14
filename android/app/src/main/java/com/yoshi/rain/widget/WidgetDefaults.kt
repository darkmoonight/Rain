package com.yoshi.rain.widget

import androidx.annotation.ColorInt
import com.yoshi.rain.R
import androidx.core.content.ContextCompat
import android.content.Context

/** Default widget colors aligned with `values/colors.xml` and `values-night/colors.xml`. */
object WidgetDefaults {
    @ColorInt const val BG_LIGHT: Int = 0xFFF0F4F8.toInt()

    @ColorInt const val BG_DARK: Int = 0xFF1A1C1E.toInt()

    @ColorInt const val TEXT_LIGHT: Int = 0xFF1A1C1E.toInt()

    @ColorInt const val TEXT_DARK: Int = 0xFFE2E2E6.toInt()

    fun textColor(context: Context): Int =
        ContextCompat.getColor(context, R.color.widget_text)
}
