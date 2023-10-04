
import 'everex_native_camera_sounds_platform_interface.dart';

class EverexNativeCameraSounds {
  Future<String?> getPlatformVersion() {
    return EverexNativeCameraSoundsPlatform.instance.getPlatformVersion();
  }
}
