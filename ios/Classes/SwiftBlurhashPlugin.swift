import Flutter
import UIKit

public class SwiftBlurhashPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "blurhash", binaryMessenger: registrar.messenger())
    let instance = SwiftBlurhashPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "blurhashDecode") {
      let arguments = call.arguments as! Dictionary<String, AnyObject>
      let blurhash = arguments["blurhash"] as! String
      let width = arguments["width"] as! Int
      let height = arguments["height"] as! Int
      let punch = arguments["punch"] as! Float

      let blurImage = UIImage(blurHash: blurhash, size: CGSize(width: width, height: height), punch: punch)
      if blurImage != nil {
        result(UIImagePNGRepresentation(blurImage!))
      } else {
        result(FlutterError(code: "INVALID_BLURHASH", message: "Failed to decode blurhash", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
