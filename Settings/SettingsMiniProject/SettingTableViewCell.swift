//
//  SettingTableViewCell.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

protocol SettingTableViewCellDelegate: class {
	func settingValueChanged(_ cell: SettingTableViewCell, selected: Bool)
}

class SettingTableViewCell: UITableViewCell {
	
    @IBAction func settingSwitchValueChanged(_ sender: Any) {
        delegate?.settingValueChanged(self, selected: settingSwitch.isOn)
    }
    
    func updateViews() {
        guard let setting = setting else { return }
        iconImageView.image = setting.image
        settingLabel.text = setting.name
        settingSwitch.isOn = setting.isSet
        backgroundColor = setting.isSet ? .yellow : .white
    }
	
	var setting: Setting? {
		didSet {
            updateViews()
        }
	}
	
	weak var delegate: SettingTableViewCellDelegate?
	
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var settingLabel: UILabel!
	@IBOutlet weak var settingSwitch: UISwitch!
}
