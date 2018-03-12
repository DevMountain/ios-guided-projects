//
//  Contact+CoreDataClass.swift
//  AddressBook
//
//  Created by Andrew R Madsen on 3/12/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Contact)
public class Contact: NSManagedObject {
	
	convenience init(context: NSManagedObjectContext = Database.shared.mainContext) {
		self.init(firstName: nil, lastName: nil, phoneNumber: nil)
	}
	
	@objc private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
	}
	
	init(context: NSManagedObjectContext = Database.shared.mainContext,
					 firstName: String?,
					 lastName: String?,
					 phoneNumber: String?,
					 uniqueID: UUID = UUID(),
					 modificationDate: Date = Date()) {
		super.init(entity: Contact.entity(), insertInto: context)
		
		self.firstName = firstName
		self.lastName = lastName
		self.phoneNumber = phoneNumber
		self.uniqueID = uniqueID
		self.modificationDate = modificationDate
	}
	
	// MARK: Overrides
	
	public override func willSave() {
		guard !isDeleted && changedValues()["modificationDate"] == nil else { return }
		
		modificationDate = Date()
	}
	
	// MARK: Properties
	
	var fullName: String? {
		switch (firstName, lastName) {
		case (let first?, let last?):
			return first + " " + last
		case (let first?, nil):
			return first
		case (nil, let last?):
			return last
		case (nil, nil):
			return nil
		}
	}
	
	@objc dynamic var firstLetterOfLastName: String? {
		guard let last = lastName else { return nil }
		return String(last[last.startIndex])
	}
	
}
