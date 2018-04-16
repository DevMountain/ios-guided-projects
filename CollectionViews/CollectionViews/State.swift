//
//  State.swift
//  CollectionViews
//
//  Created by Spencer Curtis on 3/9/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation
import UIKit

@objc class State: NSObject {
    
    let name: String
    let abbreviation: String
    
    init(name: String, abbreviation: String) {
        self.name = name
        self.abbreviation = abbreviation
    }
    
}
