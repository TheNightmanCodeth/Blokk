import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let addToChannel = FlutterMethodChannel(name: "me.jdiggity.blokk/add",
                                            binaryMessenger: controller.binaryMessenger)
      
      addToChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          if (call.method == "addToBlockList") {
              if let args = call.arguments as? Dictionary<String, Any>,
                 let toAdd = args["toAdd"] as? String {
                  self.receiveAddToBlocklist(result: result, toBlock: toAdd)
              } else { result(false) }
          } else if (call.method == "getBlockList") {
              self.receiveGetBlockList(result: result)
          }
      })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func receiveAddToBlocklist(result: FlutterResult, toBlock: String) {
    result(addToBlockList(toBlock: toBlock))
  }
    
  private func receiveGetBlockList(result: FlutterResult) {
    result(getList())
  }
}
