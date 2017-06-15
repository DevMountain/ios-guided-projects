//
//  Student.swift
//  StudentPOSTAPI
//
//  Created by Michael Mecham on 7/13/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

struct Student {
    
    let name: String
}

// MARK: - JSON Conversion

extension Student {
    
    private static var nameKey: String { return "name" }
    
    init?(dictionary: [String : String]) {
        guard let name = dictionary[Student.nameKey] else { return nil }
        
        self.name = name
    }
    
    var dictionaryRepresentation: [String : Any] {
        return [Student.nameKey: name]
    }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
}
