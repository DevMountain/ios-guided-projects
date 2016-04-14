//
//  SettingsController.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class SettingsController {
    
    static let sharedController = SettingsController()
    
    var mySettings: [Setting]
    
    init() {
        let music = Setting(name: "Music", isSet: false, image: UIImage(named: "music"))
        let apps = Setting(name: "Apps", isSet: true, image: UIImage(named: "apps"))
        let books = Setting(name: "Books", isSet: false, image: UIImage(named: "books"))
        let updates = Setting(name: "Updates", isSet: false, image: UIImage(named: "apps"))
        self.mySettings = [music, apps, books, updates]
    }
    
    func updateSettingSelection(setting: Setting, selected: Bool) {
        setting.isSet = selected
    }
    
}
