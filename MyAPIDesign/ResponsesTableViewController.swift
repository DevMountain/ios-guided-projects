//
//  ResponsesTableViewController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class ResponsesTableViewController: UITableViewController {

    var responses: [Survey] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        SurveyController.getResponses { (responses) in
            self.responses = responses
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return responses.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("responseCell", forIndexPath: indexPath)
        let response = responses[indexPath.row]
        cell.textLabel?.text = response.response
        cell.detailTextLabel?.text = response.name
        return cell
    }
    
}
