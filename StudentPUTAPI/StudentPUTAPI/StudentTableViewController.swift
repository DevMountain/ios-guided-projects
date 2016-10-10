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
	
	@IBAction func addButtonTapped(_ sender: AnyObject) {
		guard let name = nameTextField.text , name.characters.count > 0 else { return }
		StudentController.send(studentWithName: name) { (success) in
			guard success else { return }
			DispatchQueue.main.async {
				self.nameTextField.text = ""
				self.nameTextField.resignFirstResponder()
				self.fetchStudents()
			}
		}
	}
	
	// MARK: UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return students.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let student = students[(indexPath as NSIndexPath).row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
		cell.textLabel?.text = student.name
		return cell
	}
	
	// MARK: Properties
	
	var students = [Student]() {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	@IBOutlet weak var nameTextField: UITextField!
}
