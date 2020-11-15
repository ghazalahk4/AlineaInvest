//
//  AppDelegate.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let vc = TabMainViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
}

