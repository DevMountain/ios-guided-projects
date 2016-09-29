//
//  WeekTableViewController.swift
//  TableViewMiniLesson
//
//  Created by James Pacheco on 5/3/16.
//  Copyright © 2016 Jake Herrmann. All rights reserved.
//

import UIKit

class WeekTableViewController: UITableViewController {
	
	var daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath)
		cell.textLabel?.text = daysOfWeek[indexPath.row]
		return cell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return daysOfWeek.count
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 135
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "DetailSegue" {
			guard let indexPath = tableView.indexPathForSelectedRow else { return }
			let day = daysOfWeek[indexPath.row]
			
			let detailViewController = segue.destination
			detailViewController.title = day
		}
	}
}
