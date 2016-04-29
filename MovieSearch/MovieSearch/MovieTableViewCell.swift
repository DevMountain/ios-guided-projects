//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: Movie?
    
    func updateWithMovie(movie: Movie) {
        self.movie = movie
        self.titleLabel.text = movie.title
        ImageController.imageForURL(movie.imageURL) { (image) in
            if movie == self.movie {
                self.movieImageView.image = image
            }
        }
    }
    
    func cellWillStopDisplaying() {
        self.movieImageView.image = nil
        self.titleLabel.text = ""
        self.movie = nil
    }

}
