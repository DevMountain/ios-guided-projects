//
//  AppearanceController.swift
//  NotificationMiniProject2
//
//  Created by James Pacheco on 4/14/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class AppearanceController {
    
    static func setAppearance() {
        UILabel.appearance().backgroundColor = .lightGrayColor()
        UITextField.appearance().backgroundColor = .yellowColor()
        UIButton.appearance().tintColor = .redColor()
        UITabBar.appearance().tintColor = .greenColor()
    }
    
}