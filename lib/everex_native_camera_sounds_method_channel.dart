import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'everex_native_camera_sounds_platform_interface.dart';

/// An implementation of [EverexNativeCameraSoundsPlatform] that uses method channels.
class MethodChannelEverexNativeCameraSounds extends EverexNativeCameraSoundsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('everex_native_camera_sounds');

  @override
  Future<void> play() {
    return methodChannel.invokeMethod<void>('play');
  }

  @override
  Future<void> startRecord() async {
    await methodChannel.invokeMethod<void>('start_record');
  }

  @override
  Future<void> endRecord() async {
    await methodChannel.invokeMethod<void>('end_record');
  }
}
