import UIKit
import Flutter
import Firebase
import Stripe

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure()
      StripeAPI.defaultPublishableKey = "pk_test_51KcVhbJXiDQqVJbyAHNEhlX1YoSGTj4GepKKTPAFICAlRtlcbC4Qfi8Hk5BEENnVeFrgk7ssCgq9vdYTLp5X2hYT001IvKQDmc"


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


}
