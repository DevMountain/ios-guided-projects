//
//  SettingTableViewCell.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

protocol SettingTableViewCellDelegate: class {
	func settingValueChanged(cell: SettingTableViewCell, selected: Bool)
}

class SettingTableViewCell: UITableViewCell {
	
    @IBAction func settingSwitchValueChanged(sender: AnyObject) {
        delegate?.settingValueChanged(self, selected: settingSwitch.on)
    }
	
	var setting: Setting? {
		didSet {
			guard let setting = setting else { return }
			iconImageView.image = setting.image
			settingLabel.text = setting.name
			settingSwitch.on = setting.isSet
			backgroundColor = setting.isSet ? .yellowColor() : .whiteColor()
		}
	}
	
	weak var delegate: SettingTableViewCellDelegate?
	
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var settingLabel: UILabel!
	@IBOutlet weak var settingSwitch: UISwitch!
}
