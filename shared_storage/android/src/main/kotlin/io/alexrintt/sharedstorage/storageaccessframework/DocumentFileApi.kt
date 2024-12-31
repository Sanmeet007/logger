package io.alexrintt.sharedstorage.storageaccessframework

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.DocumentsContract
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.documentfile.provider.DocumentFile
import com.anggrayudi.storage.extension.isTreeDocumentFile
import com.anggrayudi.storage.file.child
import io.flutter.plugin.common.*
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.alexrintt.sharedstorage.ROOT_CHANNEL
import io.alexrintt.sharedstorage.SharedStoragePlugin
import io.alexrintt.sharedstorage.plugin.*
import io.alexrintt.sharedstorage.storageaccessframework.lib.*
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import java.io.FileNotFoundException
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream

/**
 * Aimed to implement strictly only the APIs already available from the native and original
 * `DocumentFile` API
 *
 * Basically, this is just an adapter of the native `DocumentFile` class to a Flutter Plugin class,
 * without any modifications or abstractions
 */
internal class DocumentFileApi(private val plugin: SharedStoragePlugin) :
  MethodChannel.MethodCallHandler, PluginRegistry.ActivityResultListener,
  Listenable, ActivityListener, StreamHandler {
  private val pendingResults: MutableMap<Int, Pair<MethodCall, MethodChannel.Result>> =
    mutableMapOf()
  private var channel: MethodChannel? = null
  private var eventChannel: EventChannel? = null
  private var eventSink: EventChannel.EventSink? = null

  companion object {
    private const val CHANNEL = "documentfile"
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      GET_DOCUMENT_CONTENT -> {
        val uri = Uri.parse(call.argument<String>("uri")!!)

        if (Build.VERSION.SDK_INT >= API_21) {
          CoroutineScope(Dispatchers.IO).launch {
            val content = readDocumentContent(uri)

            launch(Dispatchers.Main) { result.success(content) }
          }
        } else {
          result.notSupported(call.method, API_21)
        }
      }
      OPEN_DOCUMENT -> if (Build.VERSION.SDK_INT >= API_21) {
        openDocument(call, result)
      }
      OPEN_DOCUMENT_TREE -> if (Build.VERSION.SDK_INT >= API_21) {
        openDocumentTree(call, result)
      }
      CREATE_FILE -> if (Build.VERSION.SDK_INT >= API_21) {
        createFile(
          result,
          call.argument<String>("mimeType")!!,
          call.argument<String>("displayName")!!,
          call.argument<String>("directoryUri")!!,
          call.argument<ByteArray>("content")!!
        )
      }
      WRITE_TO_FILE -> writeToFile(
        result,
        call.argument<String>("uri")!!,
        call.argument<ByteArray>("content")!!,
        call.argument<String>("mode")!!
      )
      PERSISTED_URI_PERMISSIONS -> persistedUriPermissions(result)
      RELEASE_PERSISTABLE_URI_PERMISSION -> releasePersistableUriPermission(
        result, call.argument<String?>("uri") as String
      )
      FROM_TREE_URI -> if (Build.VERSION.SDK_INT >= API_21) {
        result.success(
          createDocumentFileMap(
            documentFromUri(
              plugin.context, call.argument<String?>("uri") as String
            )
          )
        )
      }
      CAN_WRITE -> if (Build.VERSION.SDK_INT >= API_21) {
        result.success(
          documentFromUri(
            plugin.context, call.argument<String?>("uri") as String
          )?.canWrite()
        )
      }
      CAN_READ -> if (Build.VERSION.SDK_INT >= API_21) {
        val uri = call.argument<String?>("uri") as String

        result.success(documentFromUri(plugin.context, uri)?.canRead())
      }
      LENGTH -> if (Build.VERSION.SDK_INT >= API_21) {
        result.success(
          documentFromUri(
            plugin.context, call.argument<String?>("uri") as String
          )?.length()
        )
      }
      EXISTS -> if (Build.VERSION.SDK_INT >= API_21) {
        result.success(
          documentFromUri(
            plugin.context, call.argument<String?>("uri") as String
          )?.exists()
        )
      }
      DELETE -> if (Build.VERSION.SDK_INT >= API_21) {
        result.success(
          documentFromUri(
            plugin.context, call.argument<String?>("uri") as String
          )?.delete()
        )
      }
      LAST_MODIFIED -> if (Build.VERSION.SDK_INT >= API_21) {
        val document = documentFromUri(
          plugin.context, call.argument<String?>("uri") as String
        )

        result.success(document?.lastModified())
      }
      CREATE_DIRECTORY -> {
        if (Build.VERSION.SDK_INT >= API_21) {
          val uri = call.argument<String?>("uri") as String
          val displayName = call.argument<String?>("displayName") as String

          val createdDirectory =
            documentFromUri(plugin.context, uri)?.createDirectory(displayName)
              ?: return

          result.success(createDocumentFileMap(createdDirectory))
        } else {
          result.notSupported(call.method, API_21)
        }
      }
      FIND_FILE -> {
        if (Build.VERSION.SDK_INT >= API_21) {
          val uri = call.argument<String?>("uri") as String
          val displayName = call.argument<String?>("displayName") as String

          result.success(
            createDocumentFileMap(
              documentFromUri(
                plugin.context, uri
              )?.findFile(displayName)
            )
          )
        }
      }
      COPY -> {
        val uri = Uri.parse(call.argument<String>("uri")!!)
        val destination = Uri.parse(call.argument<String>("destination")!!)

        if (Build.VERSION.SDK_INT >= API_21) {
          if (Build.VERSION.SDK_INT >= API_24) {
            DocumentsContract.copyDocument(
              plugin.context.contentResolver, uri, destination
            )
          } else {
            val inputStream = openInputStream(uri)
            val outputStream = openOutputStream(destination)

            outputStream?.let { inputStream?.copyTo(it) }
          }
        } else {
          result.notSupported(
            RENAME_TO,
            API_21,
            mapOf("uri" to "$uri", "destination" to "$destination")
          )
        }
      }
      RENAME_TO -> {
        val uri = call.argument<String?>("uri") as String
        val displayName = call.argument<String?>("displayName") as String

        if (Build.VERSION.SDK_INT >= API_21) {
          documentFromUri(plugin.context, uri)?.apply {
            val success = renameTo(displayName)

            result.success(
              if (success) createDocumentFileMap(
                documentFromUri(
                  plugin.context, this.uri
                )!!
              )
              else null
            )
          }
        } else {
          result.notSupported(
            RENAME_TO, API_21, mapOf("uri" to uri, "displayName" to displayName)
          )
        }
      }
      PARENT_FILE -> {
        val uri = call.argument<String>("uri")!!

        if (Build.VERSION.SDK_INT >= API_21) {
          val parent = documentFromUri(plugin.context, uri)?.parentFile

          result.success(if (parent != null) createDocumentFileMap(parent) else null)
        } else {
          result.notSupported(PARENT_FILE, API_21, mapOf("uri" to uri))
        }
      }
      CHILD -> {
        val uri = call.argument<String>("uri")!!
        val path = call.argument<String>("path")!!
        val requiresWriteAccess =
          call.argument<Boolean>("requiresWriteAccess") ?: false

        if (Build.VERSION.SDK_INT >= API_21) {
          val document = documentFromUri(plugin.context, uri)
          val childDocument =
            document?.child(plugin.context, path, requiresWriteAccess)

          result.success(createDocumentFileMap(childDocument))
        } else {
          result.notSupported(CHILD, API_21, mapOf("uri" to uri))
        }
      }
      else -> result.notImplemented()
    }
  }

  @RequiresApi(API_21)
  private fun openDocument(call: MethodCall, result: MethodChannel.Result) {
    val initialUri = call.argument<String>("initialUri")
    val grantWritePermission = call.argument<Boolean>("grantWritePermission")!!
    val persistablePermission =
      call.argument<Boolean>("persistablePermission")!!

    val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
      addCategory(Intent.CATEGORY_OPENABLE)
      if (persistablePermission) {
        addFlags(
          Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
        )
      }

      if (grantWritePermission) {
        addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
      }

      addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)

      if (initialUri != null) {
        val tree =
          DocumentFile.fromTreeUri(plugin.context, Uri.parse(initialUri))
        if (Build.VERSION.SDK_INT >= API_26) {
          putExtra(DocumentsContract.EXTRA_INITIAL_URI, tree?.uri)
        }
      }

      type = call.argument<String>("mimeType") ?: "*/*"
      putExtra(
        Intent.EXTRA_ALLOW_MULTIPLE, call.argument<Boolean>("multiple") ?: false
      )
    }

    if (pendingResults[OPEN_DOCUMENT_CODE] != null) return

    pendingResults[OPEN_DOCUMENT_CODE] = Pair(call, result)

    plugin.binding?.activity?.startActivityForResult(intent, OPEN_DOCUMENT_CODE)
  }

  @RequiresApi(API_21)
  private fun openDocumentTree(call: MethodCall, result: MethodChannel.Result) {
    val initialUri = call.argument<String>("initialUri")
    val grantWritePermission = call.argument<Boolean>("grantWritePermission")!!
    val persistablePermission =
      call.argument<Boolean>("persistablePermission")!!

    val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
      if (persistablePermission) {
        addFlags(
          Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
        )
      }

      addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)

      if (grantWritePermission) {
        addFlags(
          Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        )
      }

      if (initialUri != null) {
        val tree =
          DocumentFile.fromTreeUri(plugin.context, Uri.parse(initialUri))

        if (Build.VERSION.SDK_INT >= API_26) {
          putExtra(
            if (Build.VERSION.SDK_INT >= API_26) DocumentsContract.EXTRA_INITIAL_URI
            else DOCUMENTS_CONTRACT_EXTRA_INITIAL_URI, tree?.uri
          )
        }
      }
    }

    if (pendingResults[OPEN_DOCUMENT_TREE_CODE] != null) return

    pendingResults[OPEN_DOCUMENT_TREE_CODE] = Pair(call, result)

    plugin.binding?.activity?.startActivityForResult(
      intent, OPEN_DOCUMENT_TREE_CODE
    )
  }

  @RequiresApi(API_21)
  private fun createFile(
    result: MethodChannel.Result,
    mimeType: String,
    displayName: String,
    directory: String,
    content: ByteArray
  ) {
    createFile(Uri.parse(directory), mimeType, displayName, content) {
      result.success(createDocumentFileMap(this))
    }
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  private fun createFile(
    treeUri: Uri,
    mimeType: String,
    displayName: String,
    content: ByteArray,
    block: DocumentFile?.() -> Unit
  ) {
    val createdFile = documentFromUri(plugin.context, treeUri)!!.createFile(
      mimeType, displayName
    )

    createdFile?.uri?.apply {
      plugin.context.contentResolver.openOutputStream(this)?.apply {
        write(content)
        flush()
        close()

        val createdFileDocument =
          documentFromUri(plugin.context, createdFile.uri)

        block(createdFileDocument)
      }
    }
  }

  private fun writeToFile(
    result: MethodChannel.Result, uri: String, content: ByteArray, mode: String
  ) {
    try {
      plugin.context.contentResolver.openOutputStream(Uri.parse(uri), mode)
        ?.apply {
          write(content)
          flush()
          close()

          result.success(true)
        }
    } catch (e: Exception) {
      result.success(false)
    }
  }

  @RequiresApi(API_19)
  private fun persistedUriPermissions(result: MethodChannel.Result) {
    val persistedUriPermissions =
      plugin.context.contentResolver.persistedUriPermissions

    result.success(persistedUriPermissions.map {
      mapOf(
        "isReadPermission" to it.isReadPermission,
        "isWritePermission" to it.isWritePermission,
        "persistedTime" to it.persistedTime,
        "uri" to "${it.uri}",
        "isTreeDocumentFile" to it.uri.isTreeDocumentFile
      )
    }.toList())
  }

  @RequiresApi(API_19)
  private fun releasePersistableUriPermission(
    result: MethodChannel.Result, directoryUri: String
  ) {
    val targetUri = Uri.parse(directoryUri)

    val persistedUriPermissions =
      plugin.context.contentResolver.persistedUriPermissions

    for (persistedUriPermission in persistedUriPermissions) {
      if (persistedUriPermission.uri == targetUri) {
        var flags = 0

        if (persistedUriPermission.isReadPermission) {
          flags = flags or Intent.FLAG_GRANT_READ_URI_PERMISSION
        }

        if (persistedUriPermission.isWritePermission) {
          flags = flags or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        }

        plugin.context.contentResolver.releasePersistableUriPermission(
          targetUri,
          flags
        )
      }
    }

    result.success(null)
  }

  @RequiresApi(API_19)
  override fun onActivityResult(
    requestCode: Int, resultCode: Int, resultIntent: Intent?
  ): Boolean {
    when (requestCode) {
      OPEN_DOCUMENT_TREE_CODE -> {
        val pendingResult =
          pendingResults[OPEN_DOCUMENT_TREE_CODE] ?: return false

        val grantWritePermission =
          pendingResult.first.argument<Boolean>("grantWritePermission")!!
        val persistablePermission =
          pendingResult.first.argument<Boolean>("persistablePermission")!!

        try {
          val uri = resultIntent?.data

          if (uri != null) {
            if (persistablePermission) {
              if (grantWritePermission) {
                plugin.context.contentResolver.takePersistableUriPermission(
                  uri,
                  Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION
                )
              } else {
                plugin.context.contentResolver.takePersistableUriPermission(
                  uri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                )
              }
            }

            pendingResult.second.success("$uri")

            return true
          }

          pendingResult.second.success(null)
        } finally {
          pendingResults.remove(OPEN_DOCUMENT_TREE_CODE)
        }
      }
      OPEN_DOCUMENT_CODE -> {
        val pendingResult = pendingResults[OPEN_DOCUMENT_CODE] ?: return false

        val grantWritePermission =
          pendingResult.first.argument<Boolean>("grantWritePermission")!!
        val persistablePermission =
          pendingResult.first.argument<Boolean>("persistablePermission")!!

        try {
          // if data.clipData not null, uriList from data.clipData, else uriList is data.data
          val uriList = resultIntent?.clipData?.let {
            (0 until it.itemCount).map { i -> it.getItemAt(i).uri }
          } ?: resultIntent?.data?.let { listOf(it) }

          // After some experiments, I noticed that you need grant both (read and write permission)
          // otherwise, when rebooting the read permission will fail).
          fun persistUriListWithWritePermissionAndReadPermission() {
            for (uri in uriList!!) {
              plugin.context.contentResolver.takePersistableUriPermission(
                uri,
                Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION
              )
            }
          }

          fun persistUriListWithReadPermissionOnly() {
            for (uri in uriList!!) {
              plugin.context.contentResolver.takePersistableUriPermission(
                uri, Intent.FLAG_GRANT_READ_URI_PERMISSION
              )
            }
          }

          fun persistUriList() {
            if (grantWritePermission) {
              persistUriListWithWritePermissionAndReadPermission()
            } else {
              persistUriListWithReadPermissionOnly()
            }
          }

          if (uriList != null) {
            if (persistablePermission) {
              persistUriList()
            }

            pendingResult.second.success(uriList.map { "$it" })

            return true
          }

          pendingResult.second.success(null)
        } finally {
          pendingResults.remove(OPEN_DOCUMENT_CODE)
        }
      }
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
      LIST_FILES -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        listFilesEvent(eventSink, args)
      }
    }
  }

  /**
   * Read files of a given `uri` and dispatches all files under it through the `eventSink` and
   * closes the stream after the last record
   *
   * Useful to read files under a `uri` with a large set of children
   */
  private fun listFilesEvent(
    eventSink: EventChannel.EventSink?, args: Map<*, *>
  ) {
    if (eventSink == null) return

    val columns = args["columns"] as List<*>
    val uri = Uri.parse(args["uri"] as String)
    val document = DocumentFile.fromTreeUri(plugin.context, uri)

    if (document == null) {
      eventSink.error(
        EXCEPTION_NOT_SUPPORTED,
        "Android SDK must be greater or equal than [Build.VERSION_CODES.N]",
        "Got (Build.VERSION.SDK_INT): ${Build.VERSION.SDK_INT}"
      )
    } else {
      if (!document.canRead()) {
        val error = "You cannot read a URI that you don't have read permissions"

        Log.d("NO PERMISSION!!!", error)

        eventSink.error(
          EXCEPTION_MISSING_PERMISSIONS, error, mapOf("uri" to args["uri"])
        )

        eventSink.endOfStream()
      } else {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
          CoroutineScope(Dispatchers.IO).launch {
            try {
              traverseDirectoryEntries(
                plugin.context.contentResolver,
                rootOnly = true,
                targetUri = document.uri,
                columns = columns.map {
                  parseDocumentFileColumn(parseDocumentFileColumn(it as String)!!)
                }.toTypedArray()
              ) { data, _ ->
                launch(Dispatchers.Main) {
                  eventSink.success(
                    data
                  )
                }
              }
            } finally {
              launch(Dispatchers.Main) { eventSink.endOfStream() }
            }
          }
        }
      }
    }
  }

  /** Alias for `plugin.context.contentResolver.openOutputStream(uri)` */
  private fun openOutputStream(uri: Uri): OutputStream? {
    return plugin.context.contentResolver.openOutputStream(uri)
  }

  /** Alias for `plugin.context.contentResolver.openInputStream(uri)` */
  private fun openInputStream(uri: Uri): InputStream? {
    return plugin.context.contentResolver.openInputStream(uri)
  }

  /** Get a document content as `ByteArray` equivalent to `Uint8List` in Dart */
  @RequiresApi(API_21)
  private fun readDocumentContent(uri: Uri): ByteArray? {
    return try {
      val inputStream = openInputStream(uri)

      val bytes = inputStream?.readBytes()

      inputStream?.close()

      bytes
    } catch (e: FileNotFoundException) {
      null
    } catch (e: IOException) {
      null
    }
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
  }
}
