//
//  AppDelegate.swift
//  PlaylistCoreData
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
	
	func applicationWillResignActive(_ application: UIApplication) {
		PlaylistController.sharedInstance.saveToPersistentStore()
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		PlaylistController.sharedInstance.saveToPersistentStore()
	}
}

