import 'everex_native_camera_sounds_platform_interface.dart';

class EverexNativeCameraSounds {
  static Future<void> play() {
    return EverexNativeCameraSoundsPlatform.instance.play();
  }

  static Future<void> startRecord() async {
    await EverexNativeCameraSoundsPlatform.instance.startRecord();
  }

  static Future<void> endRecord() async {
    await EverexNativeCameraSoundsPlatform.instance.endRecord();
  }
}
