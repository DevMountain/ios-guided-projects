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
        
        StudentController.fetchStudents {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
	}
	
	// MARK: Actions
	
	@IBAction func addButtonTapped(_ sender: Any) {
		guard let name = nameTextField.text, name.count > 0 else { return }
        
        StudentController.putStudentWith(name: name) { (success) in
            
			guard success else { return }
            
			DispatchQueue.main.async {
				self.nameTextField.text = ""
				self.nameTextField.resignFirstResponder()
                self.tableView.reloadData()
			}
		}
	}
	
	// MARK: UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return StudentController.students.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        
        let student = StudentController.students[indexPath.row]
        
		cell.textLabel?.text = student.name
        
		return cell
	}
	
	// MARK: Properties

	@IBOutlet weak var nameTextField: UITextField!
}
