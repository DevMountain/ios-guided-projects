//
//  Survey.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

struct Survey {
    
	init(name: String, response: String, identifier: UUID = UUID()) {
        self.name = name
        self.response = response
        self.identifier = identifier
    }
	
	// MARK: Properties
	
	let name: String
	let response: String
	let identifier: UUID
}

// MARK: - JSON Conversion

extension Survey {
	
	private static var NameKey: String { return "name" }
	private static var ResponseKey: String { return "response" }
	
	init?(dictionary: [String:Any], identifier: String) {
		guard let name = dictionary[Survey.NameKey] as? String,
			let response = dictionary[Survey.ResponseKey] as? String,
			let identifier = UUID(uuidString: identifier) else {
				return nil
		}
		
		self.init(name: name, response: response, identifier: identifier)
	}
	
	var jsonValue: [String : Any] {
		return [Survey.NameKey: name, Survey.ResponseKey: response]
	}
	
	var jsonData: Data? {
		return try? JSONSerialization.data(withJSONObject: jsonValue, options: .prettyPrinted)
	}
}
