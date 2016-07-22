//
//  StudentTableViewController.swift
//  StudentSearch
//
//  Created by Michael Mecham on 7/18/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController, UISearchResultsUpdating {

    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
    
    func setupSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsTVC")
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else { return }
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search for a student"
        searchController.definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
	
	// MARK: UISearchResultsUpdating
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
               resultsController = searchController.searchResultsController as? ResultsTableViewController else { return }
        resultsController.filteredStudents = StudentController.searchForStudentWithName(text.lowercaseString)
        resultsController.tableView.reloadData()
    }
	
    // MARK: UITableViewDataSource
	
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.students.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath)
        let student = StudentController.students[indexPath.row]
        cell.textLabel?.text = student
        return cell
    }
}
