package io.alexrintt.sharedstorage

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.alexrintt.sharedstorage.environment.EnvironmentApi
import io.alexrintt.sharedstorage.mediastore.MediaStoreApi
import io.alexrintt.sharedstorage.storageaccessframework.StorageAccessFrameworkApi

const val ROOT_CHANNEL = "io.alexrintt.plugins/sharedstorage"

/** Flutter plugin Kotlin implementation `SharedStoragePlugin` */
class SharedStoragePlugin : FlutterPlugin, ActivityAware {
  /** `Environment` API channel */
  private val environmentApi = EnvironmentApi(this)

  /** `MediaStore` API channel */
  private val mediaStoreApi = MediaStoreApi(this)

  /** `DocumentFile` API channel */
  private val storageAccessFrameworkApi = StorageAccessFrameworkApi(this)

  lateinit var context: Context
  var binding: ActivityPluginBinding? = null

  /** Setup all APIs */
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext

    environmentApi.startListening(flutterPluginBinding.binaryMessenger)
    mediaStoreApi.startListening(flutterPluginBinding.binaryMessenger)
    storageAccessFrameworkApi.startListening(flutterPluginBinding.binaryMessenger)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.binding = binding

    storageAccessFrameworkApi.startListeningToActivity()
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
    environmentApi.stopListening()
    mediaStoreApi.stopListening()
    storageAccessFrameworkApi.stopListening()
  }

  override fun onDetachedFromActivityForConfigChanges() {
    storageAccessFrameworkApi.stopListeningToActivity()
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    this.binding = binding
  }

  override fun onDetachedFromActivity() {
    binding = null
  }
}
