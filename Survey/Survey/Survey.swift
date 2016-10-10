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
    let identifier: UUID
    
    var jsonValue: [String:AnyObject] {
        return [kName:name as AnyObject, kResponse:response as AnyObject]
    }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: jsonValue, options: .prettyPrinted)
    }
    
    var endpoint: URL? {
        return SurveyController.baseURL?.appendingPathComponent("\(identifier.uuidString)").appendingPathExtension("json")
        // component = /  ex: /api/v1/dfgdf-e56-d-56-fg-ert-dfv
        // extension = .  ex: .json
    }
    
    init(name: String, response: String) {
        self.name = name
        self.response = response
        self.identifier = UUID()
    }
    
    init?(dictionary: [String:AnyObject], identifier: String) {
        guard let name = dictionary[kName] as? String,
        let response = dictionary[kResponse] as? String,
            let identifier = UUID(uuidString: identifier) else {
                return nil
        }
        self.name = name
        self.response = response
        self.identifier = identifier
    }
}









