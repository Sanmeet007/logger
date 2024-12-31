package io.alexrintt.sharedstorage.storageaccessframework.lib

/**
 * Exceptions
 */
const val EXCEPTION_MISSING_PERMISSIONS = "EXCEPTION_MISSING_PERMISSIONS"
const val EXCEPTION_CANT_OPEN_DOCUMENT_FILE =
  "EXCEPTION_CANT_OPEN_DOCUMENT_FILE"
const val EXCEPTION_ACTIVITY_NOT_FOUND = "EXCEPTION_ACTIVITY_NOT_FOUND"
const val EXCEPTION_CANT_OPEN_FILE_DUE_SECURITY_POLICY =
  "EXCEPTION_CANT_OPEN_FILE_DUE_SECURITY_POLICY"

/**
 * Others
 */
const val DOCUMENTS_CONTRACT_EXTRA_INITIAL_URI =
  "android.provider.extra.INITIAL_URI"

/**
 * Available DocumentFile Method Channel APIs
 */
const val OPEN_DOCUMENT = "openDocument"
const val OPEN_DOCUMENT_TREE = "openDocumentTree"
const val PERSISTED_URI_PERMISSIONS = "persistedUriPermissions"
const val RELEASE_PERSISTABLE_URI_PERMISSION = "releasePersistableUriPermission"
const val CREATE_FILE = "createFile"
const val WRITE_TO_FILE = "writeToFile"
const val FROM_TREE_URI = "fromTreeUri"
const val CAN_WRITE = "canWrite"
const val CAN_READ = "canRead"
const val RENAME_TO = "renameTo"
const val LENGTH = "length"
const val EXISTS = "exists"
const val PARENT_FILE = "parentFile"
const val CREATE_DIRECTORY = "createDirectory"
const val DELETE = "delete"
const val FIND_FILE = "findFile"
const val COPY = "copy"
const val LAST_MODIFIED = "lastModified"
const val GET_DOCUMENT_THUMBNAIL = "getDocumentThumbnail"
const val CHILD = "child"

/**
 * Available DocumentFileHelper Method Channel APIs
 */
const val OPEN_DOCUMENT_FILE = "openDocumentFile"

/**
 * Available Event Channels APIs
 */
const val LIST_FILES = "listFiles"
const val GET_DOCUMENT_CONTENT = "getDocumentContent"

/**
 * Intent Request Codes
 */
const val OPEN_DOCUMENT_TREE_CODE = 10
const val OPEN_DOCUMENT_CODE = 11
