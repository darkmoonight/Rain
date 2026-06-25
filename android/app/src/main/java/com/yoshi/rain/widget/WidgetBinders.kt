package com.yoshi.rain.widget

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.widget.RemoteViews
import androidx.annotation.IdRes
import com.yoshi.rain.MainActivity
import com.yoshi.rain.R
import kotlin.math.roundToInt

/**
 * Binds cached weather data into Material You home-screen widget layouts.
 */
object WidgetBinders {

    private fun temperatureWithDegreeOnly(raw: String): String {
        if (raw.isBlank() || raw == "--°") return raw
        val number = Regex("""-?\d+(?:[.,]\d+)?""")
            .find(raw)
            ?.value
            ?.replace(',', '.')
            ?.toDoubleOrNull()
            ?: return raw
        return "${number.roundToInt()}°"
    }

    private object SafeViews {
        fun setText(views: RemoteViews, @IdRes id: Int, text: CharSequence) {
            try {
                views.setTextViewText(id, text)
            } catch (_: Exception) {
            }
        }

        fun setCharSequence(views: RemoteViews, @IdRes id: Int, method: String, value: CharSequence) {
            try {
                views.setCharSequence(id, method, value)
            } catch (_: Exception) {
            }
        }
    }

    /** Builds the 1x1 Material You forecast widget. */
    fun materialYouForecast1x1(context: Context, bundle: WidgetBundle): RemoteViews {
        val views = RemoteViews(context.packageName, R.layout.widget_material_you_forecast_1x1)
        applyClick(context, views, android.R.id.background)
        val current = bundle.current ?: return views

        SafeViews.setText(
            views,
            R.id.widget_material_you_forecast_currentTemperature,
            temperatureWithDegreeOnly(current.temperature),
        )
        WidgetIconHelper.setIcon(views, R.id.widget_material_you_forecast_currentIcon, current.icon)
        WidgetIconHelper.applyColors(
            context,
            views,
            R.id.widget_material_you_forecast_bg,
            R.drawable.widget_m3_background,
            bundle.settings,
            intArrayOf(R.id.widget_material_you_forecast_currentTemperature),
            containerViewId = android.R.id.background,
            widthDimen = R.dimen.widget_grid_1,
            heightDimen = R.dimen.widget_grid_1,
        )
        return views
    }

    /** Builds the wide Material You current-conditions widget. */
    fun materialYouCurrent(context: Context, bundle: WidgetBundle): RemoteViews {
        val views = RemoteViews(context.packageName, R.layout.widget_material_you_current)
        applyClick(context, views, R.id.widget_material_you_current)
        val current = bundle.current ?: return views
        SafeViews.setText(
            views,
            R.id.widget_material_you_current_currentTemperature,
            temperatureWithDegreeOnly(current.temperature),
        )
        WidgetIconHelper.setIcon(views, R.id.widget_material_you_current_currentIcon, current.icon)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            views.setFloat(R.id.widget_material_you_current_currentIcon, "setTranslationZ", 8f)
            views.setFloat(R.id.widget_material_you_current_currentIcon, "setElevation", 8f)
        }
        WidgetIconHelper.applyColors(
            context,
            views,
            R.id.widget_material_you_current_bg,
            R.drawable.widget_m3_current_background,
            bundle.settings,
            intArrayOf(R.id.widget_material_you_current_currentTemperature),
            containerViewId = R.id.widget_material_you_current,
        )
        return views
    }

    fun clockHorizontal(context: Context, bundle: WidgetBundle): RemoteViews {
        val views = RemoteViews(context.packageName, R.layout.widget_clock_day_horizontal)
        applyClick(context, views, R.id.widget_clock_day)
        val current = bundle.current ?: return views

        applyClockFormat(views, R.id.widget_clock_day_clock_light, bundle.settings.timeformat)

        val dateFormat = "EEE, d MMM"
        SafeViews.setCharSequence(views, R.id.widget_clock_day_title, "setFormat12Hour", dateFormat)
        SafeViews.setCharSequence(views, R.id.widget_clock_day_title, "setFormat24Hour", dateFormat)

        WidgetIconHelper.setIcon(views, R.id.widget_clock_day_icon, current.icon)

        val subtitle = buildString {
            if (current.location.isNotBlank()) append(current.location)
            val temp = temperatureWithDegreeOnly(current.temperature)
            if (temp.isNotBlank()) {
                if (isNotEmpty()) append(' ')
                append(temp)
            }
        }
        SafeViews.setText(views, R.id.widget_clock_day_subtitle, subtitle)

        WidgetIconHelper.applyColors(
            context,
            views,
            R.id.widget_clock_day_bg,
            R.drawable.widget_m3_background,
            bundle.settings,
            intArrayOf(
                R.id.widget_clock_day_clock_light,
                R.id.widget_clock_day_title,
                R.id.widget_clock_day_subtitle,
            ),
            containerViewId = R.id.widget_clock_day,
            widthDimen = R.dimen.widget_grid_4,
            heightDimen = R.dimen.widget_forecast_bar_height,
        )
        return views
    }

    private fun applyClockFormat(views: RemoteViews, clockId: Int, timeformat: String) {
        val use12 = timeformat == "12"
        SafeViews.setCharSequence(
            views,
            clockId,
            "setFormat12Hour",
            if (use12) "h:mm" else "HH:mm",
        )
        SafeViews.setCharSequence(views, clockId, "setFormat24Hour", "HH:mm")
    }

    private fun applyClick(context: Context, views: RemoteViews, viewId: Int) {
        val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        } else {
            PendingIntent.FLAG_UPDATE_CURRENT
        }
        views.setOnClickPendingIntent(
            viewId,
            PendingIntent.getActivity(
                context,
                0,
                Intent(context, MainActivity::class.java),
                flags,
            ),
        )
    }
}
