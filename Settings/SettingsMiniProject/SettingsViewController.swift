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
	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.shared.mySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as? SettingTableViewCell

        let setting = SettingsController.shared.mySettings[(indexPath as NSIndexPath).row]
		cell?.setting = setting
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func settingValueChanged(_ cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting,
            let cellIndexPath = tableView.indexPath(for: cell) else {return}
        tableView.beginUpdates()
		setting.isSet = selected
        tableView.reloadRows(at: [cellIndexPath], with: .automatic)
        tableView.endUpdates()
    }

}
