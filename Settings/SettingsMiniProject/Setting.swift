//
//  Setting.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class Setting {
    
    init(name: String, isSet: Bool, image: UIImage?) {
        self.name = name
        self.isSet = isSet
        self.image = image
    }
	
	var image: UIImage?
	let name: String
	var isSet: Bool
}