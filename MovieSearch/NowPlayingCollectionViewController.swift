//
//  NowPlayingCollectionViewController.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCell"

class NowPlayingCollectionViewController: UICollectionViewController, MovieControllerDelegate, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating {
    
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.sharedInstance.delegate = self
        setupSearchController()
        self.collectionView?.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func nowPlayingMoviesChanged() {
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieController.sharedInstance.nowPlayingMovies.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? MovieCollectionViewCell
        let movie = MovieController.sharedInstance.nowPlayingMovies[indexPath.row]
        cell?.updateWithMovie(movie)
        
        return cell ?? UICollectionViewCell()
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var header = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader {
            header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath)
            guard let searchBar = self.searchController?.searchBar else {return header}
            header.addSubview(searchBar)
        }
        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(self.view.frame.width, 44)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.width/2 - 10, self.view.frame.width/2 - 10)
    }
    
    func setupSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsController")
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else {return}
        searchController.searchBar.placeholder = "Search all movies"
        searchController.searchResultsUpdater = self
        searchController.definesPresentationContext = true
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
            resultsController = searchController.searchResultsController as? ResultsCollectionViewController else {return}
        MovieController.sharedInstance.searchMovies(text) { (movies) in
            resultsController.filteredMovies = movies
            resultsController.collectionView?.reloadData()
        }
    }}
