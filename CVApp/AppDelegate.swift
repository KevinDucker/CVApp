//
//  AppDelegate.swift
//  CVApp

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var router: CVRouter?
  var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.router = CVRouter(window: window!)
    window?.makeKeyAndVisible()
    return true
  }
}
