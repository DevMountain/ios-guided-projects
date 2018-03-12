//
//  Contact+JSON.swift
//  AddressBook
//
//  Created by Andrew Madsen on 3/6/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import Foundation
import CoreData

// JSON Conversion

extension Contact {
	
	private static let firstNameKey = "firstName"
	private static let lastNameKey = "lastName"
	private static let phoneNumberKey = "phoneNumber"
	private static let uniqueIDKey = "uniqueID"
	private static let modificationDateKey = "modificationDate"
	
	convenience init?(context: NSManagedObjectContext = Database.shared.mainContext, dictionary: [String : Any]) {
		
		let firstName = dictionary[Contact.firstNameKey] as? String
		let lastName = dictionary[Contact.lastNameKey] as? String
		let phoneNumber = dictionary[Contact.phoneNumberKey] as? String
		guard let uniqueIDString = dictionary[Contact.uniqueIDKey] as? String,
			let uniqueID = UUID(uuidString: uniqueIDString) else {
			return nil
		}
		
		self.init(context: context, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, uniqueID: uniqueID)
	}
	
	func update(with dictionary: [String : Any]) {
		
		guard let uniqueIDString = dictionary[Contact.uniqueIDKey] as? String,
			let uniqueID = UUID(uuidString: uniqueIDString),
			(uniqueID == self.uniqueID || self.uniqueID == nil) else {
				return
		}
		
		firstName = dictionary[Contact.firstNameKey] as? String
		lastName = dictionary[Contact.lastNameKey] as? String
		phoneNumber = dictionary[Contact.phoneNumberKey] as? String
	}
	
	var dictionaryRepresentation: [String : Any] {
		var dictionary = [String : Any]()
		dictionary[Contact.firstNameKey] = firstName
		dictionary[Contact.lastNameKey] = lastName
		dictionary[Contact.phoneNumberKey] = phoneNumber
		dictionary[Contact.uniqueIDKey] = uniqueID?.uuidString ?? UUID().uuidString
		dictionary[Contact.modificationDateKey] = Contact.iso8601Formatter.string(from: Date())
		return dictionary
	}
	
	private static let iso8601Formatter = ISO8601DateFormatter()
}

