//
//  ResultsCollectionViewController.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCell"

class ResultsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var filteredMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovies.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? MovieCollectionViewCell
    
        let movie = filteredMovies[indexPath.row]
        cell?.updateWithMovie(movie)
    
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.width/2 - 10, self.view.frame.width/2 - 10)
    }
    
    
    
}
