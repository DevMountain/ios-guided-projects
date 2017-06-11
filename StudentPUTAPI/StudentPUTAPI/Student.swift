//
//  Student.swift
//  StudentPOSTAPI
//
//  Created by Michael Mecham on 7/13/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Student {
    let name: String
    
    private let nameKey = "name"
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String : String]) {
        guard let name = dictionary[nameKey] else { return nil }
        
        self.name = name
    }
    
    var dictionaryRepresentation: [String : Any] {
        return [nameKey: name]
    }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
}
