//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell?.updateWithMovie(movie)

        return cell ?? UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell = cell as? MovieTableViewCell
        cell?.cellWillStopDisplaying()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text where searchTerm.characters.count > 0 else {return}
        MovieController.sharedInstance.searchMovies(searchTerm) { (movies) in
            self.movies = movies
            self.tableView.reloadData()
        }
    }

}
