//
//  FirebaseController.swift
//  FirebaseRestaurantList
//
//  Created by James Pacheco on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    static let base = Firebase(url: "https://restaurant-learning.firebaseio.com")
}

protocol FirebaseType {
    var identifier: String? {get set}
    var endpoint: String {get}
    var jsonValue: [String: AnyObject] {get}
    
    init?(dictionary: [String: AnyObject], identifier: String)
    
    mutating func save()
    func delete()
}

extension FirebaseType {
    mutating func save() {
        var newBase = FirebaseController.base.childByAppendingPath(self.endpoint)
        if let identifier = identifier {
            newBase = newBase.childByAppendingPath(identifier)
        } else {
            newBase = newBase.childByAutoId()
            self.identifier = newBase.key
        }
        newBase.updateChildValues(self.jsonValue)
    }
    
    func delete() {
        guard let identifier = self.identifier else {return}
        let newBase = FirebaseController.base.childByAppendingPath(self.endpoint).childByAppendingPath(identifier)
        newBase.removeValue()
    }
}