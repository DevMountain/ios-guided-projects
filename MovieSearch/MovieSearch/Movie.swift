//
//  Movie.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    private let kTitle = "title"
    private let kImageEndpoint = "poster_path"
    
    let title: String
    let imageEndpoint: String
    var imageURL: String {
        return "http://image.tmdb.org/t/p/w500/\(imageEndpoint)"
    }
    
    init?(json: [String:AnyObject]) {
        guard let title = json[kTitle] as? String,
            imageEndpoint = json[kImageEndpoint] as? String else {return nil}
        self.title = title
        self.imageEndpoint = imageEndpoint
    }
}