package com.yoshi.rain.widget

import android.graphics.BitmapFactory
import android.graphics.Color
import android.widget.RemoteViews
import android.util.Log

object WidgetIconHelper {
    private const val TAG = "WidgetIconHelper"

    fun setIcon(views: RemoteViews, viewId: Int, path: String?) {
        if (path.isNullOrEmpty()) return
        try {
            BitmapFactory.decodeFile(path)?.let { views.setImageViewBitmap(viewId, it) }
        } catch (t: Throwable) {
            Log.w(TAG, "Failed to decode icon: $path", t)
        }
    }

    fun applyColors(views: RemoteViews, rootId: Int, settings: WidgetSettings, vararg textIds: Int) {
        settings.backgroundColor?.let { hex ->
            try {
                views.setInt(rootId, "setBackgroundColor", Color.parseColor(hex))
            } catch (_: IllegalArgumentException) {
            }
        }
        settings.textColor?.let { hex ->
            try {
                val color = Color.parseColor(hex)
                textIds.forEach { views.setTextColor(it, color) }
            } catch (_: IllegalArgumentException) {
            }
        }
    }
}
