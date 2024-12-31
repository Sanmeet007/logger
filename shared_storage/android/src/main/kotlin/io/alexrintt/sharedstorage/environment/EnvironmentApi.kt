package io.alexrintt.sharedstorage.environment

import android.os.Build
import android.os.Environment
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.alexrintt.sharedstorage.ROOT_CHANNEL
import io.alexrintt.sharedstorage.SharedStoragePlugin
import io.alexrintt.sharedstorage.plugin.API_30
import io.alexrintt.sharedstorage.plugin.Listenable
import io.alexrintt.sharedstorage.plugin.notSupported
import java.io.File

class EnvironmentApi(val plugin: SharedStoragePlugin) :
    MethodChannel.MethodCallHandler, Listenable {
  private var channel: MethodChannel? = null

  companion object {
    const val GET_EXTERNAL_STORAGE_PUBLIC_DIRECTORY = "getExternalStoragePublicDirectory"
    const val GET_ROOT_DIRECTORY = "getRootDirectory"
    const val GET_EXTERNAL_STORAGE_DIRECTORY = "getExternalStorageDirectory"
    const val GET_DATA_DIRECTORY = "getDataDirectory"
    const val GET_DOWNLOAD_CACHE_DIRECTORY = "getDownloadCacheDirectory"
    const val GET_STORAGE_DIRECTORY = "getStorageDirectory"

    const val CHANNEL = "environment"
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      GET_EXTERNAL_STORAGE_PUBLIC_DIRECTORY ->
          getExternalStoragePublicDirectory(result, call.argument<String?>("directory") as String)
      GET_EXTERNAL_STORAGE_DIRECTORY -> getExternalStorageDirectory(result)
      GET_ROOT_DIRECTORY -> getRootDirectory(result)
      GET_DATA_DIRECTORY -> getDataDirectory(result)
      GET_STORAGE_DIRECTORY -> getStorageDirectory(result)
      GET_DOWNLOAD_CACHE_DIRECTORY -> getDownloadCacheDirectory(result)
      else -> result.notImplemented()
    }
  }

  /** Deprecated Android API, use only if you know exactly what you need */
  private fun getExternalStoragePublicDirectory(result: MethodChannel.Result, directory: String) =
      result.success(environmentDirectoryOf(directory).absolutePath)

  private fun getDataDirectory(result: MethodChannel.Result) =
      result.success(Environment.getDataDirectory().absolutePath)

  private fun getStorageDirectory(result: MethodChannel.Result) {
    if (Build.VERSION.SDK_INT >= API_30) {
      result.success(Environment.getStorageDirectory().absolutePath)
    } else {
      result.notSupported("getStorageDirectory", API_30)
    }
  }

  private fun getDownloadCacheDirectory(result: MethodChannel.Result) =
      result.success(Environment.getDownloadCacheDirectory().absolutePath)

  /** Deprecated Android API, use only if you know exactly what you need */
  private fun getExternalStorageDirectory(result: MethodChannel.Result) =
      result.success(Environment.getExternalStorageDirectory().absolutePath)

  private fun getRootDirectory(result: MethodChannel.Result) =
      result.success(Environment.getRootDirectory().absolutePath)

  private fun environmentDirectoryOf(directory: String): File {
    val mapper =
        mapOf(
            "EnvironmentDirectory.Alarms" to Environment.DIRECTORY_ALARMS,
            "EnvironmentDirectory.DCIM" to Environment.DIRECTORY_DCIM,
            "EnvironmentDirectory.Downloads" to Environment.DIRECTORY_DOWNLOADS,
            "EnvironmentDirectory.Movies" to Environment.DIRECTORY_MOVIES,
            "EnvironmentDirectory.Music" to Environment.DIRECTORY_MUSIC,
            "EnvironmentDirectory.Notifications" to Environment.DIRECTORY_NOTIFICATIONS,
            "EnvironmentDirectory.Pictures" to Environment.DIRECTORY_PICTURES,
            "EnvironmentDirectory.Podcasts" to Environment.DIRECTORY_PODCASTS,
            "EnvironmentDirectory.Ringtones" to Environment.DIRECTORY_RINGTONES
        )

    return Environment.getExternalStoragePublicDirectory(mapper[directory] ?: directory)
  }

  override fun startListening(binaryMessenger: BinaryMessenger) {
    if (channel != null) {
      stopListening()
    }

    channel = MethodChannel(binaryMessenger, "$ROOT_CHANNEL/$CHANNEL")
    channel?.setMethodCallHandler(this)
  }

  override fun stopListening() {
    if (channel == null) return

    channel?.setMethodCallHandler(null)
    channel = null
  }
}
