//
//  Message.swift
//  BulletinBoard
//
//  Created by Andrew Madsen on 6/17/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Foundation

public class Message: NSObject {
	
	public init(messageText: String, date: NSDate = NSDate()) {
		self.date = date
		self.messageText = messageText
	}
	
	public let date: NSDate
	public let messageText: String
}