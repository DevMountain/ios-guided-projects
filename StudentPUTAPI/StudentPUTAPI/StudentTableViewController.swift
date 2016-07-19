//
//  StudentTableViewController.swift
//  StudentPOSTAPI
//
//  Created by Michael Mecham on 7/13/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchStudents()
	}
	
	private func fetchStudents() {
		StudentController.fetchStudents { (students) in
			self.students = students
		}
	}
	
	// MARK: Actions
	
	@IBAction func addButtonTapped(sender: AnyObject) {
		guard let name = nameTextField.text where name.characters.count > 0 else { return }
		StudentController.sendStudent(name) { (success) in
			guard success else { return }
			dispatch_async(dispatch_get_main_queue()) {
				self.nameTextField.text = ""
				self.nameTextField.resignFirstResponder()
				self.fetchStudents()
			}
		}
	}
	
	// MARK: Table view data source
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return students.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let student = students[indexPath.row]
		
		let cell = tableView.dequeueReusableCellWithIdentifier("StudentCell", forIndexPath: indexPath)
		cell.textLabel?.text = student.name
		return cell
	}
	
	// MARK: Properties
	
	var students = [Student]() {
		didSet {
			dispatch_async(dispatch_get_main_queue()) {
				self.tableView.reloadData()
			}
		}
	}
	
	@IBOutlet weak var nameTextField: UITextField!
}
