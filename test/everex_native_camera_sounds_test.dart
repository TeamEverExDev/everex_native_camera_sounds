import 'package:flutter_test/flutter_test.dart';
import 'package:everex_native_camera_sounds/everex_native_camera_sounds.dart';
import 'package:everex_native_camera_sounds/everex_native_camera_sounds_platform_interface.dart';
import 'package:everex_native_camera_sounds/everex_native_camera_sounds_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEverexNativeCameraSoundsPlatform
    with MockPlatformInterfaceMixin
    implements EverexNativeCameraSoundsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> endRecord() {
    // TODO: implement endRecord
    throw UnimplementedError();
  }

  @override
  Future<void> play() {
    // TODO: implement play
    throw UnimplementedError();
  }

  @override
  Future<void> startRecord() {
    // TODO: implement startRecord
    throw UnimplementedError();
  }
}

void main() {
  final EverexNativeCameraSoundsPlatform initialPlatform = EverexNativeCameraSoundsPlatform.instance;

  test('$MethodChannelEverexNativeCameraSounds is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEverexNativeCameraSounds>());
  });

  test('getPlatformVersion', () async {
    EverexNativeCameraSounds everexNativeCameraSoundsPlugin = EverexNativeCameraSounds();
    MockEverexNativeCameraSoundsPlatform fakePlatform = MockEverexNativeCameraSoundsPlatform();
    EverexNativeCameraSoundsPlatform.instance = fakePlatform;
  });
}
