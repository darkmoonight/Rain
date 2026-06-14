package com.yoshi.rain.widget

import android.content.Context
import android.os.Handler
import android.os.Looper

/**
 * Refreshes home-screen widgets after device configuration changes.
 *
 * Uses [Resources.getSystem] via [WidgetPalette.systemConfiguration] so palette
 * resolution stays correct while [MainActivity] handles `uiMode` in `configChanges`.
 */
object WidgetThemeRefreshCoordinator {
    private const val FOLLOW_UP_MS = 400L

    private val handler = Handler(Looper.getMainLooper())
    private var pending: Runnable? = null

    fun scheduleRefresh(context: Context) {
        refreshNow(context.applicationContext)
        scheduleFollowUp(context.applicationContext)
    }

    private fun refreshNow(appContext: Context) {
        RainHomeWidgetProvider.refreshAll(appContext, WidgetPalette.systemConfiguration())
    }

    private fun scheduleFollowUp(appContext: Context) {
        pending?.let { handler.removeCallbacks(it) }
        val runnable =
            Runnable {
                pending = null
                refreshNow(appContext)
            }
        pending = runnable
        handler.postDelayed(runnable, FOLLOW_UP_MS)
    }
}
