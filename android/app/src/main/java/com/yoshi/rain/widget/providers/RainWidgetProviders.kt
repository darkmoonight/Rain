package com.yoshi.rain.widget.providers

import android.content.Context
import android.widget.RemoteViews
import com.yoshi.rain.widget.RainHomeWidgetProvider
import com.yoshi.rain.widget.WidgetBinders
import com.yoshi.rain.widget.WidgetBundle

class WidgetMaterialYouForecast1x1Provider : RainHomeWidgetProvider() {
    override fun buildViews(context: Context, bundle: WidgetBundle): RemoteViews =
        WidgetBinders.materialYouForecast1x1(context, bundle)
}

class WidgetMaterialYouCurrentProvider : RainHomeWidgetProvider() {
    override fun buildViews(context: Context, bundle: WidgetBundle): RemoteViews =
        WidgetBinders.materialYouCurrent(context, bundle)
}

class WidgetClockDayHorizontalProvider : RainHomeWidgetProvider() {
    override fun buildViews(context: Context, bundle: WidgetBundle): RemoteViews =
        WidgetBinders.clockHorizontal(context, bundle)
}
