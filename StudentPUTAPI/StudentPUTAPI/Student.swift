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

// MARK: - JSON

extension Student {
	static let NameKey = "nombre"
	
	init?(dictionary: [String : String]) {
		guard let name = dictionary["nombre"] else { return nil }
		self.init(name: name)
	}
	
	var dictionaryRepresentation: [String : AnyObject] {
		return [Student.NameKey: name]
	}
	
	var jsonData: NSData? {
		return try? NSJSONSerialization.dataWithJSONObject(dictionaryRepresentation, options: .PrettyPrinted)
	}
}