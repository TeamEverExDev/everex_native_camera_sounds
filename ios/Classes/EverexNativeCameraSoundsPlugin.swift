import Flutter
import UIKit

public class EverexNativeCameraSoundsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "everex_native_camera_sounds", binaryMessenger: registrar.messenger())
    let instance = EverexNativeCameraSoundsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if #available(iOS 11.0, *) {
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1108), nil)
    } else {
        AudioServicesPlaySystemSound(1108)
    }
  }
}
