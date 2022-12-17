//
//  AppDelegate.swift
//  WeatherStackApp
//
//  Created by Hussein Anwar on 16/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vm = HomeViewModel()
        let initialVC = HomeViewController(viewModel: vm)
        self.window?.rootViewController = initialVC
        self.window?.makeKeyAndVisible()
        return true
    }

}

