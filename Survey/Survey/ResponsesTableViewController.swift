//
//  ResponsesTableViewController.swift
//  MyAPIDesign
//
//  Created by Michael Mecham on 7/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class ResponsesTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SurveyController.fetchResponses { (responses) in
            self.responses = responses
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "responseCell", for: indexPath)
        let response = responses[indexPath.row]
        cell.textLabel?.text = response.response
        cell.detailTextLabel?.text = response.name
        return cell
    }
	
	var responses = [Survey]() {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
    
}
