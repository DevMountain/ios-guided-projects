//
//  Contact+Extras.swift
//  AddressBook
//
//  Created by Andrew Madsen on 3/6/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Contact {
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

