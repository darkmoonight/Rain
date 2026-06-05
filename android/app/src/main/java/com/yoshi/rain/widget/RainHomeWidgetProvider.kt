package com.yoshi.rain.widget

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.os.Bundle
import android.util.Log
import android.widget.RemoteViews
import com.yoshi.rain.R
import es.antonborri.home_widget.HomeWidgetPlugin
import es.antonborri.home_widget.HomeWidgetProvider

abstract class RainHomeWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val TAG = "RainHomeWidgetProvider"
    }

    abstract fun buildViews(context: Context, bundle: WidgetBundle): RemoteViews

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
        appWidgetIds.forEach { id ->
            updateWidget(context, appWidgetManager, id, widgetData)
        }
    }

    private fun updateWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        widgetData: SharedPreferences,
    ) {
        val bundle = WidgetDataBridge.load(widgetData)
        try {
            if (!bundle.hasData) {
                Log.d(TAG, "Widget data missing: widget_bundle is empty (id=$appWidgetId)")
            }
            appWidgetManager.updateAppWidget(appWidgetId, buildViews(context, bundle))
        } catch (t: Throwable) {
            Log.e(
                TAG,
                "Failed to build RemoteViews for ${this::class.java.simpleName} (id=$appWidgetId). " +
                    "Falling back to widget_init.",
                t,
            )
            val fallback = RemoteViews(context.packageName, R.layout.widget_init)
            appWidgetManager.updateAppWidget(appWidgetId, fallback)
        }
    }
}
