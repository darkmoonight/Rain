package com.yoshi.rain.widget

import android.content.Context
import android.content.SharedPreferences
import android.content.res.Configuration
import org.json.JSONObject

data class WidgetCurrent(
    val location: String,
    val temperature: String,
    val icon: String?,
)

data class WidgetSettings(
    val timeformat: String,
    val themeMode: String,
    val backgroundColorLight: String?,
    val backgroundColorDark: String?,
    val textColorLight: String?,
    val textColorDark: String?,
    val useDarkPalette: Boolean,
)

data class WidgetBundle(
    val current: WidgetCurrent?,
    val settings: WidgetSettings,
) {
    val hasData: Boolean get() = current != null
}

object WidgetDataBridge {

    /** Loads widget weather payload and appearance settings from HomeWidget prefs. */
    fun load(
        context: Context,
        prefs: SharedPreferences,
        configuration: Configuration = context.resources.configuration,
    ): WidgetBundle {
        val settings = readSettings(context, prefs, configuration)
        val json = prefs.getString("widget_bundle", null) ?: return WidgetBundle(
            current = null,
            settings = settings,
        )

        return try {
            WidgetBundle(
                current = parseCurrent(JSONObject(json).optJSONObject("current")),
                settings = settings,
            )
        } catch (_: Exception) {
            WidgetBundle(current = null, settings = settings)
        }
    }

    private fun readSettings(
        context: Context,
        prefs: SharedPreferences,
        configuration: Configuration,
    ): WidgetSettings {
        // Theme mode comes from Flutter; palette slot follows device when mode is `system`.
        val themeMode = prefs.getString("widget_theme_mode", "system") ?: "system"
        return WidgetSettings(
            timeformat = prefs.getString("timeformat", "24") ?: "24",
            themeMode = themeMode,
            backgroundColorLight = prefs.getString("background_color_light", null),
            backgroundColorDark = prefs.getString("background_color_dark", null),
            textColorLight = prefs.getString("text_color_light", null),
            textColorDark = prefs.getString("text_color_dark", null),
            useDarkPalette = WidgetPalette.useDarkPalette(themeMode, configuration),
        )
    }

    private fun parseCurrent(currentObj: JSONObject?): WidgetCurrent? {
        if (currentObj == null) return null
        return WidgetCurrent(
            location = currentObj.optString("location", ""),
            temperature = currentObj.optString("temperature", "--°"),
            icon = currentObj.optString("icon", null),
        )
    }
}
