import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:everex_native_camera_sounds/everex_native_camera_sounds_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEverexNativeCameraSounds platform = MethodChannelEverexNativeCameraSounds();
  const MethodChannel channel = MethodChannel('everex_native_camera_sounds');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('play', () async {
    await platform.play();
  });

  test('start_record', () async {
    await platform.startRecord();
  });

  test('end_record', () async {
    await platform.endRecord();
  });
}
