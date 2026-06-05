package com.yoshi.rain.widget

import android.content.SharedPreferences
import org.json.JSONObject

data class WidgetCurrent(
    val location: String,
    val temperature: String,
    val icon: String?,
)

data class WidgetSettings(
    val timeformat: String,
    val backgroundColor: String?,
    val textColor: String?,
)

data class WidgetBundle(
    val current: WidgetCurrent?,
    val settings: WidgetSettings,
) {
    val hasData: Boolean get() = current != null
}

object WidgetDataBridge {

    fun load(prefs: SharedPreferences): WidgetBundle {
        val settings = readSettings(prefs)
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

    private fun readSettings(prefs: SharedPreferences): WidgetSettings =
        WidgetSettings(
            timeformat = prefs.getString("timeformat", "24") ?: "24",
            backgroundColor = prefs.getString("background_color", null),
            textColor = prefs.getString("text_color", null),
        )

    private fun parseCurrent(currentObj: JSONObject?): WidgetCurrent? {
        if (currentObj == null) return null
        return WidgetCurrent(
            location = currentObj.optString("location", ""),
            temperature = currentObj.optString("temperature", "--°"),
            icon = currentObj.optString("icon", null),
        )
    }
}
