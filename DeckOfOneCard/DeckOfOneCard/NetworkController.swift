//
//  NetworkController.swift
//  DeckOfOneCard
//
//  Created by James Pacheco on 4/18/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: (success: Bool, data: NSData?) -> Void) {
        guard let url = NSURL(string: url) else {
            completion(success: false, data: nil)
            return
        }
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { (data, _, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                completion(success: false, data: nil)
            } else {
                completion(success: true, data: data)
            }
        }
        
        task.resume()
        
    }
    
    static func serializeDataAsJson(data: NSData) -> [String: AnyObject]? {
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
    }
    
}