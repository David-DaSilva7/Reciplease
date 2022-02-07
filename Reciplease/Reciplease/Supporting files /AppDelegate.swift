//
//  AppDelegate.swift
//  Reciplease
//
//  Created by David Da Silva on 23/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
             print(urls[urls.count-1] as URL)
        return true
    }

}

