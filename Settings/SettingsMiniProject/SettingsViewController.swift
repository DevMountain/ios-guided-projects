//
//  SettingsViewController.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingTableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
	
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.sharedController.mySettings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingCell") as? SettingTableViewCell

        let setting = SettingsController.sharedController.mySettings[indexPath.row]
		cell?.setting = setting
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func settingValueChanged(cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting,
            cellIndexPath = tableView.indexPathForCell(cell) else {return}
        tableView.beginUpdates()
		setting.isSet = selected
        tableView.reloadRowsAtIndexPaths([cellIndexPath], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }

}
