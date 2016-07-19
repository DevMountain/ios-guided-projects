//
//  Survey.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Survey {
    
    private let kName = "nombre"
    private let kResponse = "respuesta"
    
    let name: String
    let response: String
    let identifier: NSUUID
    
    var jsonValue: [String:AnyObject] {
        return [kName:name, kResponse:response]
    }
    
    var jsonData: NSData? {
        return try? NSJSONSerialization.dataWithJSONObject(jsonValue, options: .PrettyPrinted)
    }
    
    var endpoint: NSURL? {
        return SurveyController.baseURL?.URLByAppendingPathComponent("\(identifier.UUIDString)").URLByAppendingPathExtension("json")
        // component = /  ex: /api/v1/dfgdf-e56-d-56-fg-ert-dfv
        // extension = .  ex: .json
    }
    
    init(name: String, response: String) {
        self.name = name
        self.response = response
        self.identifier = NSUUID()
    }
    
    init?(dictionary: [String:AnyObject], identifier: String) {
        guard let name = dictionary[kName] as? String,
        response = dictionary[kResponse] as? String,
            identifier = NSUUID(UUIDString: identifier) else {
                return nil
        }
        self.name = name
        self.response = response
        self.identifier = identifier
    }
}









