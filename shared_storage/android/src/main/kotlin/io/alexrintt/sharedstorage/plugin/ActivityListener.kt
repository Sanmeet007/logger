package io.alexrintt.sharedstorage.plugin

/**
 * Interface shared across API classes to make intuitive and clean [init] and [dispose] plugin
 * lifecycle of [Activity] listener resources
 */
interface ActivityListener {
  fun startListeningToActivity()
  fun stopListeningToActivity()
}
