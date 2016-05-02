//
//  UserController.swift
//  PlaylistFirebase
//
//  Created by James Pacheco on 5/1/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    static var currentUser: User?
    
    static func createUser(username: String, email: String, password: String, completion: (user: User?)->Void) {
        FirebaseController.base.createUser(email, password: password, withValueCompletionBlock:  { (error, authDataDictionary) in
            if let error = error {
                print(error.localizedDescription)
                completion(user: nil)
            } else {
                guard let uid = authDataDictionary["uid"] as? String else {completion(user: nil); return}
                var user = User(username: username, identifier: uid)
                user.save()
                authUser(email, password: password, completion: { (user) in
                    guard let user = user else {
                        print("User not logged in after creation")
                        completion(user: nil); return
                    }
                    completion(user: user)
                })
            }
        })
    }
    
    static func authUser(email: String, password: String, completion: (user: User?)->Void) {
        FirebaseController.base.authUser(email, password: password) { (error, authData) in
            if let error = error {
                print(error.localizedDescription)
                completion(user: nil)
                self.currentUser = nil
            } else {
                guard let uid = authData.uid else {
                    print("No uid came back with auth data")
                    completion(user: nil)
                    self.currentUser = nil
                    return
                }
                userForIdentifier(uid, completion: { (user) in
                    completion(user: user)
                    self.currentUser = user
                })
            }
        }
    }
    
    static func userForIdentifier(identifier: String, completion: (user: User?)->Void) {
        FirebaseController.base.childByAppendingPath("users").childByAppendingPath(identifier).observeSingleEventOfType(.Value, withBlock: { (data) in
            guard let value = data.value as? [String: AnyObject],
                user = User(json: value, identifier: identifier) else {
                    completion(user: nil)
                    print("No user data returned for uid: \(identifier)")
                    return
            }
            completion(user: user)
        })
    }
    
}