//
//  Survey.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Survey {
	
	/* FIXME: Don't have model object "reach" back to model controller directly. -ARM 10OCT16. */
    var endpoint: URL? {
        return SurveyController.baseURL?.appendingPathComponent("\(identifier.uuidString)").appendingPathExtension("json")
        // component = /  ex: /api/v1/dfgdf-e56-d-56-fg-ert-dfv
        // extension = .  ex: .json
    }
    
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
	
	private static var NameKey: String { return "nombre" }
	private static var ResponseKey: String { return "respuesta" }
	
	convenience init?(dictionary: [String:AnyObject], identifier: String) {
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
