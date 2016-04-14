//
//  SettingTableViewCell.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    var setting: Setting?
    
    weak var delegate: SettingTableViewCellDelegate?
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var settingLabel: UILabel!

    @IBOutlet weak var settingSwitch: UISwitch!

    func updateWithSetting(setting: Setting) {
        self.setting = setting
        iconImageView.image = setting.image
        settingLabel.text = setting.name
        settingSwitch.on = setting.isSet
        if setting.isSet {
            self.backgroundColor = .yellowColor()
        } else {
            self.backgroundColor = .whiteColor()
        }
    }
    
    @IBAction func settingSwitchValueChanged(sender: AnyObject) {
        delegate?.settingValueChanged(self, selected: settingSwitch.on)
    }
}

protocol SettingTableViewCellDelegate: class {
    func settingValueChanged(cell: SettingTableViewCell, selected: Bool)
}

