//import androidx.annotation.NonNull
//
//import android.os.AsyncTask
//import android.media.MediaActionSound
//
//import io.flutter.embedding.engine.plugins.FlutterPlugin
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//import io.flutter.plugin.common.MethodChannel.MethodCallHandler
//import io.flutter.plugin.common.MethodChannel.Result
//
///** EverexNativeCameraSoundsPlugin */
//class EverexNativeCameraSoundsPlugin : FlutterPlugin, MethodCallHandler {
//  private lateinit var channel: MethodChannel
//
//  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "everex_native_camera_sounds")
//    channel.setMethodCallHandler(this)
//  }
//
//  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
//    when (call.method) {
//      "play" -> playShutterSound(result)
//      "start_record" -> startRecordingSound(result)
//      "end_record" -> stopRecordingSound(result)
//      else -> result.notImplemented()
//    }
//  }
//
//  private fun playShutterSound(@NonNull result: Result) {
//    AsyncTask.execute {
//      val sound = MediaActionSound()
//      sound.play(MediaActionSound.SHUTTER_CLICK)
//      result.success(null)
//    }
//  }
//
//  private fun startRecordingSound(@NonNull result: Result) {
//    AsyncTask.execute {
//      val sound = MediaActionSound()
//      sound.play(MediaActionSound.START_VIDEO_RECORDING)
//      result.success(null)
//    }
//  }
//
//  private fun stopRecordingSound(@NonNull result: Result) {
//    AsyncTask.execute {
//      val sound = MediaActionSound()
//      sound.play(MediaActionSound.STOP_VIDEO_RECORDING)
//      result.success(null)
//    }
//  }
//
//  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
//    channel.setMethodCallHandler(null)
//  }
//}

package com.example.everex_native_camera_sounds

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.media.MediaActionSound

/** EverexNativeCameraSoundsPlugin */
class EverexNativeCameraSoundsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "everex_native_camera_sounds")
    channel.setMethodCallHandler(this)
  }

  /*https://developer.android.com/reference/android/media/MediaActionSound*/
  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "play") {
      val sound = MediaActionSound()
      sound.play(MediaActionSound.SHUTTER_CLICK)
    } else if (call.method == "start_record") {
      val sound = MediaActionSound()
      sound.play(MediaActionSound.START_VIDEO_RECORDING)
    } else if (call.method == "end_record") {
      val sound = MediaActionSound()
      sound.play(MediaActionSound.STOP_VIDEO_RECORDING)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}