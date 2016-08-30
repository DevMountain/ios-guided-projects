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
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("DayCell", forIndexPath: indexPath)
		cell.textLabel?.text = daysOfWeek[indexPath.row]
		return cell
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return daysOfWeek.count
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 135
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "DetailSegue" {
			guard let indexPath = tableView.indexPathForSelectedRow else { return }
			let day = daysOfWeek[indexPath.row]
			
			let detailViewController = segue.destinationViewController
			detailViewController.title = day
		}
	}
}
