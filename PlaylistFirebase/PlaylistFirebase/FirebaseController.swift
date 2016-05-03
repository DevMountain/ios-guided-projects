//
//  FirebaseController.swift
//  PlaylistFirebase
//
//  Created by James Pacheco on 5/1/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
//import Firebase
//
//class FirebaseController {
//    static let base = Firebase(url: "https://playlistfirebase.firebaseio.com")
//}
//
//protocol FirebaseType {
//    var endpoint: String {get}
//    var identifier: String? {get set}
//    var jsonValue: [String: AnyObject] {get}
//    
//    init?(json: [String: AnyObject], identifier: String)
//    
//    mutating func save()
//    func delete()
//}
//
//extension FirebaseType {
//    mutating func save() {
//        var newEndpoint = FirebaseController.base.childByAppendingPath(self.endpoint)
//        if let identifier = self.identifier {
//            newEndpoint = newEndpoint.childByAppendingPath(identifier)
//        } else {
//            newEndpoint = newEndpoint.childByAutoId()
//            self.identifier = newEndpoint.key
//        }
//        newEndpoint.updateChildValues(self.jsonValue)
//    }
//    
//    func delete() {
//        guard let identifier = self.identifier else {return}
//        FirebaseController.base.childByAppendingPath(self.endpoint).childByAppendingPath(identifier).removeValue()
//    }
//}