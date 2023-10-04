
import 'everex_native_camera_sounds_platform_interface.dart';

class EverexNativeCameraSounds {
  static Future<void> play() {
    return EverexNativeCameraSoundsPlatform.instance.play();
  }

  static Future<void> startRecord() {
    return EverexNativeCameraSoundsPlatform.instance.startRecord();
  }

  static Future<void> endRecord() {
    return EverexNativeCameraSoundsPlatform.instance.endRecord();
  }
}
