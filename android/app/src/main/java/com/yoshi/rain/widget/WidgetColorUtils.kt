package com.yoshi.rain.widget

import android.graphics.Color
import androidx.annotation.ColorInt

/** Shared color parsing helpers for Android home-screen widgets. */
object WidgetColorUtils {
    /** Parses a Flutter-style `#AARRGGBB` hex string, or returns null when invalid. */
    fun parseColorOrNull(hex: String?): Int? {
        if (hex.isNullOrBlank()) return null
        return try {
            Color.parseColor(hex)
        } catch (_: IllegalArgumentException) {
            null
        }
    }

    /** Whether [color] is set and its alpha channel is zero. */
    fun isFullyTransparent(@ColorInt color: Int?): Boolean =
        color != null && Color.alpha(color) == 0
}
