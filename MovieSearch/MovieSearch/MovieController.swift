//
//  MovieController.swift
//  MovieSearch
//
//  Created by James Pacheco on 4/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let sharedInstance = MovieController()
    
    func searchMovies(searchTerm: String, completion: (movies: [Movie])->Void) {
        let modifiedSearch = searchTerm.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "+")
        let url = "http://api.themoviedb.org/3/search/movie?query=\(modifiedSearch)&api_key=0e399a8033e204676ed83f1a0788084a"
        NetworkController.dataAtURL(url) { (data) in
            guard let data = data,
                json = NetworkController.jsonWithReturn(data),
                results = json["results"] as? [[String: AnyObject]] else {completion(movies: []); return}
            dispatch_async(dispatch_get_main_queue(), {
                let movies = results.flatMap{Movie(json: $0)}
                completion(movies: movies)
            })
        }
    }
    
}
















