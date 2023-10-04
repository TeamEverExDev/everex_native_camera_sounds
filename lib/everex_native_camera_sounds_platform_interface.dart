import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'everex_native_camera_sounds_method_channel.dart';

abstract class EverexNativeCameraSoundsPlatform extends PlatformInterface {
  /// Constructs a EverexNativeCameraSoundsPlatform.
  EverexNativeCameraSoundsPlatform() : super(token: _token);

  static final Object _token = Object();

  static EverexNativeCameraSoundsPlatform _instance = MethodChannelEverexNativeCameraSounds();

  /// The default instance of [EverexNativeCameraSoundsPlatform] to use.
  ///
  /// Defaults to [MethodChannelEverexNativeCameraSounds].
  static EverexNativeCameraSoundsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EverexNativeCameraSoundsPlatform] when
  /// they register themselves.
  static set instance(EverexNativeCameraSoundsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
