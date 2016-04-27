//
//  NetworkController.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: url) else {completion(data: nil); return}
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    completion(data: data)
                } else {
                    completion(data: nil)
                    print("No data return from network request")
                }
            }
        }
        task.resume()
    }
    
    static func jsonWithReturn(data: NSData) -> [String: AnyObject]? {
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
    }
    
}