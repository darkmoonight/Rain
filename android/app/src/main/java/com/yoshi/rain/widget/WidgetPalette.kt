package com.yoshi.rain.widget

import android.content.Context
import android.content.res.Configuration
import android.content.res.Resources

object WidgetPalette {
    /**
     * Whether the widget should use dark custom colors.
     *
     * For [themeMode] `system`, reads the **device** theme via [Resources.getSystem].
     * App [Context] resources can stay stale while [MainActivity] handles `uiMode` in
     * `configChanges`, which previously left the widget on the wrong palette.
     */
    fun useDarkPalette(
        themeMode: String,
        configuration: Configuration? = null,
    ): Boolean =
        when (themeMode) {
            "dark" -> true
            "light" -> false
            else -> isSystemDarkMode(configuration)
        }

    /** Configuration used to inflate widget resources and default colors. */
    fun themedConfiguration(
        context: Context,
        themeMode: String,
        hint: Configuration? = null,
    ): Configuration =
        when (themeMode) {
            "system" -> systemConfiguration()
            "dark" -> appConfiguration(context, hint, dark = true)
            else -> appConfiguration(context, hint, dark = false)
        }

    fun systemConfiguration(): Configuration =
        Configuration(Resources.getSystem().configuration)

    private fun appConfiguration(
        context: Context,
        hint: Configuration?,
        dark: Boolean,
    ): Configuration {
        val config = Configuration(hint ?: context.resources.configuration)
        val nightFlag =
            if (dark) Configuration.UI_MODE_NIGHT_YES else Configuration.UI_MODE_NIGHT_NO
        config.uiMode =
            (config.uiMode and Configuration.UI_MODE_NIGHT_MASK.inv()) or nightFlag
        return config
    }

    private fun isSystemDarkMode(configuration: Configuration?): Boolean {
        if (configuration != null) {
            when (configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) {
                Configuration.UI_MODE_NIGHT_YES -> return true
                Configuration.UI_MODE_NIGHT_NO -> return false
            }
        }
        val systemNight =
            Resources.getSystem().configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK
        return systemNight == Configuration.UI_MODE_NIGHT_YES
    }
}
