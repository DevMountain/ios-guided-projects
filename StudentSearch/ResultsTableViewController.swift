//
//  ResultsTableViewController.swift
//  StudentSearch
//
//  Created by Michael Mecham on 7/18/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var filteredStudents: [String] = []
    
    // MARK: - TableView Data Source Methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStudents.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultCell", forIndexPath: indexPath)
        let student = filteredStudents[indexPath.row]
        cell.textLabel?.text = student
        return cell
    }
    

}
