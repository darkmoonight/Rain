package com.yoshi.rain

import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            BACKGROUND_CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "openBatterySettings" -> result.success(openBatterySettings())
                else -> result.notImplemented()
            }
        }
    }

    /** Opens Rain app info so the user can adjust battery usage manually. */
    private fun openBatterySettings(): Boolean {
        val appDetailsIntent =
            Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
                data = Uri.parse("package:$packageName")
            }
        if (tryStartActivity(appDetailsIntent)) return true

        val batteryListIntent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
        return tryStartActivity(batteryListIntent)
    }

    private fun tryStartActivity(intent: Intent): Boolean {
        if (intent.resolveActivity(packageManager) == null) return false
        return try {
            startActivity(intent)
            true
        } catch (_: ActivityNotFoundException) {
            false
        } catch (_: SecurityException) {
            false
        }
    }

    companion object {
        private const val BACKGROUND_CHANNEL = "com.yoshi.rain/background"
    }
}
