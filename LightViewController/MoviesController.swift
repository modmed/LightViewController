//
//  MoviesController.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 6/16/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

let numberOfMoviesToFetch = 10

enum MoviesAction
{
    case showMovie
    case loadMoreMovies
    case loadingMoreMovies
}

class MoviesController {
    
    var movies : Array<Movie>
    var loading : Bool
    var canLoadMoreData = true

    init() {
        self.loading = false
        self.movies = Array<Movie>()
    }
    
    func loadMovies(completion: @escaping((Void) -> Void))
    {
        self.loading = true
        
        API.loadMovies(count: numberOfMoviesToFetch, startIndex: self.movies.count) { (results) in
            
            self.movies .append(contentsOf: results)
            
            self.loading = false
            
            self.canLoadMoreData = results.count == numberOfMoviesToFetch
            
            completion()
        }
    }
    
    func numberOfMovies () -> Int
    {
        return loading ? movies.count+1 : movies.count;
    }
    
    func lastMovie(index: Int) -> Bool
    {
        return index > movies.count
    }
    
    func movie(index :Int) -> Movie
    {
        return movies[index]
    }
    
    func moviesAction(index: Int) -> MoviesAction
    {
        var action = MoviesAction.showMovie
        
        if index >= self.movies.count-1 && self.canLoadMoreData
        {
            if self.loading
            {
                action = .loadingMoreMovies
            }
            else
            {
               action = .loadMoreMovies
            }
        }
        
        return action
    }
    
    
}
