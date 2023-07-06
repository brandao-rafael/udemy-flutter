import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let nativeChannel = FlutterMethodChannel(name: "com.example.native_calc/native", binaryMessenger: controller.binaryMessenger)
    
    nativeChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "calcSum" else {
        result(FlutterMethodNotImplemented)
        return
      }

      if let myArgs = call.arguments as? [String: Any],
        let a = myArgs["a"] as? Int,
        let b = myArgs["b"] as? Int {
          result(a + b)
      } else {
        result(-1)
      }
    })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
