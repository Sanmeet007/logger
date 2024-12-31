package io.alexrintt.sharedstorage.storageaccessframework

import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.util.Log
import io.flutter.plugin.common.*
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.alexrintt.sharedstorage.ROOT_CHANNEL
import io.alexrintt.sharedstorage.SharedStoragePlugin
import io.alexrintt.sharedstorage.plugin.ActivityListener
import io.alexrintt.sharedstorage.plugin.Listenable
import io.alexrintt.sharedstorage.storageaccessframework.lib.*

/**
 * Aimed to be a class which takes the `DocumentFile` API and implement some APIs not supported
 * natively by Android.
 *
 * This is why it is separated from the original and raw `DocumentFileApi` which is the class that
 * only exposes the APIs without modifying them (Mirror API).
 *
 * Then here is where we can implement the main abstractions/use-cases which would be available
 * globally without modifying the strict APIs.
 */
internal class DocumentFileHelperApi(private val plugin: SharedStoragePlugin) :
    MethodChannel.MethodCallHandler,
    PluginRegistry.ActivityResultListener,
    Listenable,
    ActivityListener,
    StreamHandler {
  private val pendingResults: MutableMap<Int, Pair<MethodCall, MethodChannel.Result>> =
      mutableMapOf()
  private var channel: MethodChannel? = null
  private var eventChannel: EventChannel? = null
  private var eventSink: EventChannel.EventSink? = null

  companion object {
    private const val CHANNEL = "documentfilehelper"
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      OPEN_DOCUMENT_FILE -> openDocumentFile(call, result)
      else -> result.notImplemented()
    }
  }

  private fun openDocumentFile(call: MethodCall, result: MethodChannel.Result) {
    val uri = Uri.parse(call.argument<String>("uri")!!)
    val type = call.argument<String>("type") ?: plugin.context.contentResolver.getType(uri)

    val intent =
        Intent(Intent.ACTION_VIEW).apply {
          flags = Intent.FLAG_GRANT_READ_URI_PERMISSION
          data = uri
        }

    try {
      plugin.binding?.activity?.startActivity(intent, null)

      Log.d("sharedstorage", "Successfully launched uri $uri ")

      result.success(true)
    } catch (e: ActivityNotFoundException) {
      result.error(
          EXCEPTION_ACTIVITY_NOT_FOUND,
          "There's no activity handler that can process the uri $uri of type $type",
          mapOf("uri" to "$uri", "type" to type)
      )
    } catch (e: SecurityException) {
      result.error(
          EXCEPTION_CANT_OPEN_FILE_DUE_SECURITY_POLICY,
          "Missing read and write permissions for uri $uri of type $type to launch ACTION_VIEW activity",
          mapOf("uri" to "$uri", "type" to "$type")
      )
    } catch (e: Throwable) {
      result.error(
          EXCEPTION_CANT_OPEN_DOCUMENT_FILE,
          "Couldn't start activity to open document file for uri: $uri",
          mapOf("uri" to "$uri")
      )
    }
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    when (requestCode) {
      /** TODO(@alexrintt): Implement if required */
      else -> return true
    }

    return false
  }

  override fun startListening(binaryMessenger: BinaryMessenger) {
    if (channel != null) stopListening()

    channel = MethodChannel(binaryMessenger, "$ROOT_CHANNEL/$CHANNEL")
    channel?.setMethodCallHandler(this)

    eventChannel = EventChannel(binaryMessenger, "$ROOT_CHANNEL/event/$CHANNEL")
    eventChannel?.setStreamHandler(this)
  }

  override fun stopListening() {
    if (channel == null) return

    channel?.setMethodCallHandler(null)
    channel = null

    eventChannel?.setStreamHandler(null)
    eventChannel = null
  }

  override fun startListeningToActivity() {
    plugin.binding?.addActivityResultListener(this)
  }

  override fun stopListeningToActivity() {
    plugin.binding?.removeActivityResultListener(this)
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    val args = arguments as Map<*, *>

    eventSink = events

    when (args["event"]) {
    /** TODO(@alexrintt): Implement if required */
    }
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
  }
}
