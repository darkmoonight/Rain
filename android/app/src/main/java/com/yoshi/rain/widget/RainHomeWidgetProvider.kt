package com.yoshi.rain.widget

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.content.SharedPreferences
import android.content.res.Configuration
import android.os.Bundle
import android.util.Log
import android.widget.RemoteViews
import com.yoshi.rain.R
import com.yoshi.rain.widget.providers.WidgetClockDayHorizontalProvider
import com.yoshi.rain.widget.providers.WidgetMaterialYouCurrentProvider
import com.yoshi.rain.widget.providers.WidgetMaterialYouForecast1x1Provider
import es.antonborri.home_widget.HomeWidgetPlugin
import es.antonborri.home_widget.HomeWidgetProvider

/** Base class for Rain home-screen widgets backed by HomeWidget prefs. */
abstract class RainHomeWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val TAG = "RainHomeWidgetProvider"

        private val providerClasses =
            listOf(
                // Keep in sync with [rainWidgetRegistry] in widget_registry.dart.
                WidgetMaterialYouForecast1x1Provider::class.java,
                WidgetMaterialYouCurrentProvider::class.java,
                WidgetClockDayHorizontalProvider::class.java,
            )

        fun refreshAll(context: Context, configuration: Configuration? = null) {
            providerClasses.forEach { providerClass ->
                val provider =
                    providerClass.getDeclaredConstructor().newInstance()
                        as RainHomeWidgetProvider
                provider.refreshWidgets(context, configuration)
            }
        }
    }

    abstract fun buildViews(context: Context, bundle: WidgetBundle): RemoteViews

    fun refreshWidgets(context: Context, configuration: Configuration? = null) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val componentName = ComponentName(context, javaClass)
        val ids = appWidgetManager.getAppWidgetIds(componentName)
        if (ids.isNotEmpty()) {
            onUpdate(context, appWidgetManager, ids, HomeWidgetPlugin.getData(context), configuration)
        }
    }

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: Bundle,
    ) {
        updateWidget(context, appWidgetManager, appWidgetId, HomeWidgetPlugin.getData(context))
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        onUpdate(context, appWidgetManager, appWidgetIds, widgetData, null)
    }

    private fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
        configuration: Configuration?,
    ) {
        appWidgetIds.forEach { id ->
            updateWidget(context, appWidgetManager, id, widgetData, configuration)
        }
    }

    private fun updateWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        widgetData: SharedPreferences,
        configuration: Configuration? = null,
    ) {
        val appContext = context.applicationContext
        val themeMode = widgetData.getString("widget_theme_mode", "system") ?: "system"
        val resolvedConfiguration =
            WidgetPalette.themedConfiguration(appContext, themeMode, configuration)
        val themedContext = appContext.createConfigurationContext(resolvedConfiguration)
        val bundle = WidgetDataBridge.load(themedContext, widgetData, resolvedConfiguration)
        try {
            if (!bundle.hasData) {
                Log.d(TAG, "Widget data missing: widget_bundle is empty (id=$appWidgetId)")
            }
            appWidgetManager.updateAppWidget(appWidgetId, buildViews(themedContext, bundle))
        } catch (t: Throwable) {
            Log.e(
                TAG,
                "Failed to build RemoteViews for ${this::class.java.simpleName} (id=$appWidgetId). " +
                    "Falling back to widget_init.",
                t,
            )
            val fallback = RemoteViews(appContext.packageName, R.layout.widget_init)
            appWidgetManager.updateAppWidget(appWidgetId, fallback)
        }
    }
}
