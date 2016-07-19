//
//  AppDelegate.swift
//  BulletinBoard
//
//  Created by Andrew Madsen on 6/18/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		
		let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Sound], categories: nil)
		UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
		
		
		return true
	}
	
	func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
		UIApplication.sharedApplication().registerForRemoteNotifications()
		MessagesController.sharedController.subscribeForPushNotifications()
	}

	func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
		MessagesController.sharedController.refresh()
	}
}

