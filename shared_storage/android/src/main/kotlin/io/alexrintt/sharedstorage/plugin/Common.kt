package io.alexrintt.sharedstorage.plugin

import android.os.Build
import io.flutter.plugin.common.MethodChannel

fun MethodChannel.Result.notSupported(
  method: String,
  minSdk: Int,
  debug: Map<String, String> = emptyMap()
) {
  error(
    EXCEPTION_NOT_SUPPORTED,
    "Unsupported API. Current API: ${Build.VERSION.SDK_INT} | Required: $minSdk",
    mapOf("method" to method, *debug.toList().toTypedArray())
  )
}

inline fun <reified T : Enum<T>> valueOf(type: String?): T? {
  if (type == null) return null

  return try {
    java.lang.Enum.valueOf(T::class.java, type)
  } catch (e: Exception) {
    null
  }
}

inline fun <reified T : Enum<T>> valueOf(type: String?, default: T): T = valueOf<T>(type) ?: default
