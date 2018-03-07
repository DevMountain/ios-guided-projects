//
//  ContactDetailViewController.swift
//  AddressBook
//
//  Created by Andrew Madsen on 3/6/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController, UITextFieldDelegate {

	// MARK: Overridden
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let editButton = editButtonItem
		editButton.action = #selector(toggleEditing(_:))
		navigationItem.rightBarButtonItem = editButton
		updateViews(animated: false)
	}
	
	// MARK: Public Methods
	
	// MARK: Actions
	
	@IBAction func cancel(_ sender: Any) {
		setEditing(false, animated: true)
	}
	
	@IBAction func toggleEditing(_ sender: Any) {
		if isEditing { saveContact() }
		setEditing(!isEditing, animated: true)
	}
	
	// MARK: UITextFieldDelegate
	
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		return isEditing
	}
	
	// MARK: Private Methods
	
	private func updateViews(animated: Bool = true) {
		guard isViewLoaded else { return }
		guard let contact = contact else {
			title = nil
			
			firstNameField.text = nil
			lastNameField.text = nil
			phoneNumberField.text = nil
			
			return
		}
		
		title = contact.fullName
		
		firstNameField.text = contact.firstName
		lastNameField.text = contact.lastName
		phoneNumberField.text = contact.phoneNumber
		
		navigationItem.setHidesBackButton(isEditing, animated: animated)
		navigationItem.leftBarButtonItem = isEditing ? cancelButton : nil
		if (!isEditing) {
			firstNameField.resignFirstResponder()
			lastNameField.resignFirstResponder()
			phoneNumberField.resignFirstResponder()
		}
	}
	
	private func saveContact() {
		guard let contact = contact else { return }
		
		contact.firstName = firstNameField.text
		contact.lastName = lastNameField.text
		contact.phoneNumber = phoneNumberField.text
		
		do {
			try contact.managedObjectContext?.save()
		} catch {
			NSLog("Error saving contact \(contact): \(error)")
		}
	}
	
	// MARK: Public Properties
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		updateViews(animated: animated)
	}
	
	var contact: Contact? {
		didSet {
			updateViews()
		}
	}
	
	// MARK: Private Properties
	
	lazy var cancelButton: UIBarButtonItem = {
		let result = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
		return result
	}()
	
	// MARK: Outlets
	@IBOutlet var firstNameField: UITextField!
	@IBOutlet var lastNameField: UITextField!
	@IBOutlet var phoneNumberField: UITextField!
}
