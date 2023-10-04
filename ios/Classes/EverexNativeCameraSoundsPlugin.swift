import Flutter
import UIKit
import AVFoundation

public class EverexNativeCameraSoundsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "everex_native_camera_sounds", binaryMessenger: registrar.messenger())
    let instance = EverexNativeCameraSoundsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if #available(iOS 11.0, *) {
        if (call.method == "play") {
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1108), nil)
        } else if (call.method == "start_record") {
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1117), nil)
        } else if (call.method == "end_record") {
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1118), nil)
        }
    } else {
        AudioServicesPlaySystemSound(1108)
    }
  }
}
