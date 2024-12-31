package io.alexrintt.sharedstorage.mediastore

import android.os.Build
import android.provider.MediaStore
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.alexrintt.sharedstorage.ROOT_CHANNEL
import io.alexrintt.sharedstorage.SharedStoragePlugin
import io.alexrintt.sharedstorage.plugin.API_29
import io.alexrintt.sharedstorage.plugin.Listenable

class MediaStoreApi(val plugin: SharedStoragePlugin) : MethodChannel.MethodCallHandler, Listenable {
  private var channel: MethodChannel? = null

  companion object {
    private const val GET_MEDIA_STORE_CONTENT_DIRECTORY = "getMediaStoreContentDirectory"
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      GET_MEDIA_STORE_CONTENT_DIRECTORY -> {
        getMediaStoreContentDirectory(
          result,
          call.argument<String?>("collection") as String
        )
      }
      else -> result.notImplemented()
    }
  }

  private fun getMediaStoreContentDirectory(
    result: MethodChannel.Result,
    collection: String
  ) = result.success(mediaStoreOf(collection))

  /**
   * Returns the [EXTERNAL_CONTENT_URI] of [MediaStore.<MEDIA>] equivalent to [collection]
   */
  private fun mediaStoreOf(collection: String): String? {
    val mapper = mutableMapOf(
      "MediaStoreCollection.Audio" to MediaStore.Audio.Media.EXTERNAL_CONTENT_URI.path,
      "MediaStoreCollection.Video" to MediaStore.Video.Media.EXTERNAL_CONTENT_URI.path,
      "MediaStoreCollection.Images" to MediaStore.Images.Media.EXTERNAL_CONTENT_URI.path
    )

    if (Build.VERSION.SDK_INT >= API_29) {
      mapper["MediaStoreCollection.Downloads"] =
        MediaStore.Downloads.EXTERNAL_CONTENT_URI.path
    }

    return mapper[collection]
  }

  override fun startListening(binaryMessenger: BinaryMessenger) {
    if (channel != null) {
      stopListening()
    }

    channel = MethodChannel(binaryMessenger, "$ROOT_CHANNEL/mediastore")
    channel?.setMethodCallHandler(this)
  }

  override fun stopListening() {
    if (channel == null) return

    channel?.setMethodCallHandler(null)
    channel = null
  }
}
