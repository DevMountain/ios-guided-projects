//
//  AppDelegate.swift
//  AddressBook
//
//  Created by Andrew Madsen on 3/6/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

	ContactsController.shared.syncAllContacts { (error) in
		if let error = error {
			NSLog("Error syncing contacts: \(error)")
		}
	}
	
    return true
  }

}

