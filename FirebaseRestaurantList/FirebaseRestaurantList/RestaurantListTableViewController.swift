//
//  RestaurantListTableViewController.swift
//  FirebaseRestaurantList
//
//  Created by James Pacheco on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RestaurantListTableViewController.updateUI), name: "restaurantsUpdated", object: nil)
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RestaurantController.sharedInstance.restaurants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath)
        
        let restaurant = RestaurantController.sharedInstance.restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.category
        
        return cell
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        var nameTextField: UITextField? = nil
        var categoryTextField: UITextField? = nil
        let alert = UIAlertController(title: "Add a restaurant", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Name"
            nameTextField = textField
        }
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Category"
            categoryTextField = textField
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let addRestaurantAction = UIAlertAction(title: "Add Restaurant", style: .Default) { (_) in
            guard let name = nameTextField?.text,
                category = categoryTextField?.text where name.characters.count > 0 else { return}
            RestaurantController.sharedInstance.addRestaurant(name, category: category)
        }
        alert.addAction(cancelAction)
        alert.addAction(addRestaurantAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let restaurant = RestaurantController.sharedInstance.restaurants[indexPath.row]
            RestaurantController.sharedInstance.deleteRestaurant(restaurant)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

}
