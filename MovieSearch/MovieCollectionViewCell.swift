//
//  MovieCollectionViewCell.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie: Movie?
 
    func updateWithMovie(movie: Movie) {
        movieImageView.image = nil
        self.movie = movie
        self.movieTitleLabel.text = movie.title
        ImageController.imageForURL(movie.imageURL) { (image) in
            if movie.title == self.movie?.title ?? "" {
                self.movieImageView.image = image
            }
        }
    }
    
}
