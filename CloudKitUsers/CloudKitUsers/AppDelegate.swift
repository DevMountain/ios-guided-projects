//
//  AppDelegate.swift
//  CloudKitUsers
//
//  Created by Spencer Curtis on 3/23/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UserController.shared.fetchCurrentUser()
        
        return true
    }
}

