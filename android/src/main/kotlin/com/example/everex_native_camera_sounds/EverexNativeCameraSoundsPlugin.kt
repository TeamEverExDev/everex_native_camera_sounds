import android.os.AsyncTask
import android.media.MediaActionSound
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** EverexNativeCameraSoundsPlugin  */
class EverexNativeCameraSoundsPlugin : FlutterPlugin, MethodCallHandler {
  private var channel: MethodChannel? = null
  @Override
  fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getBinaryMessenger(), "everex_native_camera_sounds")
    channel.setMethodCallHandler(this)
  }

  @Override
  fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method.equals("play")) {
      playShutterSound(result)
    } else if (call.method.equals("start_record")) {
      startRecordingSound(result)
    } else if (call.method.equals("end_record")) {
      stopRecordingSound(result)
    } else {
      result.notImplemented()
    }
  }

  private fun playShutterSound(@NonNull result: Result) {
    // 현재 스레드가 메인 스레드이므로 백그라운드 스레드로 작업을 전달
    object : AsyncTask<Void?, Void?, Void?>() {
      @Override
      protected fun doInBackground(vararg voids: Void?): Void? {
        val sound = MediaActionSound()
        sound.play(MediaActionSound.SHUTTER_CLICK)
        return null
      }
    }.execute()
    result.success(null)
  }

  private fun startRecordingSound(@NonNull result: Result) {
    // 현재 스레드가 메인 스레드이므로 백그라운드 스레드로 작업을 전달
    object : AsyncTask<Void?, Void?, Void?>() {
      @Override
      protected fun doInBackground(vararg voids: Void?): Void? {
        val sound = MediaActionSound()
        sound.play(MediaActionSound.START_VIDEO_RECORDING)
        return null
      }
    }.execute()
    result.success(null)
  }

  private fun stopRecordingSound(@NonNull result: Result) {
    // 현재 스레드가 메인 스레드이므로 백그라운드 스레드로 작업을 전달
    object : AsyncTask<Void?, Void?, Void?>() {
      @Override
      protected fun doInBackground(vararg voids: Void?): Void? {
        val sound = MediaActionSound()
        sound.play(MediaActionSound.STOP_VIDEO_RECORDING)
        return null
      }
    }.execute()
    result.success(null)
  }

  @Override
  fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding?) {
    channel.setMethodCallHandler(null)
  }
}
