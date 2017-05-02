//
//  StatesCollectionViewController.swift
//  CollectionViews
//
//  Created by Spencer Curtis on 3/9/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import UIKit

class StatesCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StateController.shared.states.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stateCell", for: indexPath) as? StateCollectionViewCell else { return UICollectionViewCell() }
    
        let state = StateController.shared.states[indexPath.row]
        
        cell.state = state
    
        return cell
    }
}










