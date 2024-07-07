package com.logger.app

import android.Manifest
import android.content.ContentResolver
import android.content.ContentValues
import android.content.pm.PackageManager
import android.provider.CallLog
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.logger.app/imp_cl_fmc" // flutter method channel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "insertCallLogs" -> {
                        val callLogs = call.arguments as? List<Map<String, Any>>

                        if (callLogs != null) {
                            insertCallLogs(callLogs)
                            result.success("Call logs inserted successfully")
                        } else {
                            result.error("INVALID_ARGUMENT", "Invalid call logs format", null)
                        }
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            } catch (e: Exception) {
                val errorMessage = e.message ?: "Unknown error"
                result.error("FILE_ERROR", "Invalid or corrupted file: $errorMessage", null)
            }
        }
    }

    private fun insertCallLogs(callLogs: List<Map<String, Any>>) {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_CALL_LOG) ==
                        PackageManager.PERMISSION_GRANTED
        ) {
            val contentResolver: ContentResolver = contentResolver

            // Create a list of ContentValues for batch insert
            val valuesList = ArrayList<ContentValues>()

            // Convert each call log entry to ContentValues and add to the list
            callLogs.forEach { log ->
                val values =
                ContentValues().apply {
                    (log["name"] as? String)?.let { put(CallLog.Calls.CACHED_NAME, it) }
                    (log["duration"] as? Int)?.let { put(CallLog.Calls.DURATION, it) }
                    (log["number"] as? String)?.let { put(CallLog.Calls.NUMBER, it) }
                    (log["formatted_number"] as? String)?.let { put(CallLog.Calls.CACHED_FORMATTED_NUMBER, it) }
                    (log["timestamp"] as? Long)?.let { put(CallLog.Calls.DATE, it) }
                    (log["phone_account_id"] as? String)?.let { put(CallLog.Calls.PHONE_ACCOUNT_ID, it) }
                    (log["call_type"] as? Int)?.let { put(CallLog.Calls.TYPE, it) }
                    put(CallLog.Calls.NEW, 1) // This line does not need a null check as it is always 1
                    (log["cached_number_label"] as? String)?.let { put(CallLog.Calls.CACHED_NUMBER_LABEL, it) }
                    (log["cached_number_type"] as? Int)?.let { put(CallLog.Calls.CACHED_NUMBER_TYPE, it) }
                    (log["cached_matched_number"] as? String)?.let { put(CallLog.Calls.CACHED_MATCHED_NUMBER, it) }
                }
                valuesList.add(values)
            }

            // Use bulkInsert for efficient batch insertion
            contentResolver.bulkInsert(CallLog.Calls.CONTENT_URI, valuesList.toTypedArray())
        } else {
            // Handle permission request or denial
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.WRITE_CALL_LOG), 1)
        }
    }
}
