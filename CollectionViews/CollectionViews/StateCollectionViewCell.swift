//
//  StateCollectionViewCell.swift
//  CollectionViews
//
//  Created by Spencer Curtis on 3/9/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class StateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var stateNameLabel: UILabel!
    
    var state: State? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let state = state else { return }
        flagImageView.image = UIImage(named: state.abbreviation)
        stateNameLabel.text = state.name
    }
    
}












