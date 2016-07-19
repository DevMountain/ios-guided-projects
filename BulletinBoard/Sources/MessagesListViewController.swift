//
//  MessagesListViewController.swift
//  BulletinBoard
//
//  Created by Andrew Madsen on 6/18/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import UIKit

class MessagesListViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let nc = NSNotificationCenter.defaultCenter()
		nc.addObserver(self,
		               selector: #selector(messagesWereUpdated(_:)),
		               name: MessagesControllerDidRefreshNotification,
		               object: nil)
	}

	@IBAction func post(sender: UIButton) {
		guard let messageText = textField.text else { return }
		textField.resignFirstResponder()
		let message = Message(messageText: messageText, date: NSDate())
		MessagesController.sharedController.postNewMessage(message)
	}
	
	func messagesWereUpdated(notification: NSNotification) {
		tableView?.reloadData()
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	// MARK: UITableViewDelegate/Datasource

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return MessagesController.sharedController.messages.count
	}
	
	let dateFormatter: NSDateFormatter = {
		let formatter = NSDateFormatter()
		formatter.dateStyle = .ShortStyle
		formatter.doesRelativeDateFormatting = true
		formatter.timeStyle = .ShortStyle
		return formatter
	}()
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell") else {
			return UITableViewCell()
		}
		
		let messages = MessagesController.sharedController.messages
		let message = messages[indexPath.row]
		
		cell.textLabel?.text = message.messageText
		cell.detailTextLabel?.text = dateFormatter.stringFromDate(message.date)
		
		return cell
	}
	
	@IBOutlet var textField: UITextField!
	@IBOutlet var tableView: UITableView!
}
