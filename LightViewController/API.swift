//
//  API.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 6/16/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

class API {
    
    // This will mimic an API to return data
    static func loadMovies(count : Int , startIndex : Int, results : @escaping (_ movies : Array<Movie>) -> Void)
    {
        var movies = Array<Movie>()
        
        if count+startIndex < 100 // For fake API we need an end condition to stop fetching data
        {
            for index in startIndex...startIndex+count-1
            {
                let movieDictionary = ["Id" : "\(index)",
                    "Title": "Movie \(index)",
                    "Bio": "This is a bio for Movile \(index).",
                    "Rating": index%2 == 0 ? "PG-13": "PG",
                    "Poster": "\(index)"]
                
                
                movies.append(Movie(withJSON: movieDictionary))
            }
        }
        
        // Mimic Network delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1))
        {
            results(movies)
        }
    }
    
    // Fake API method (instead of hittin an API just return array of movies to the user untill you hit 100
//    static func loadMovies(count : Int , startIndex : Int) -> Array<Movie>
//    {
//        var movies = Array<Movie>()
//        
//        if count+startIndex < 100 // fake end of list once we reach 100
//        {
//            for index in startIndex...startIndex+count
//            {
//                let movieDictionary = ["Title": "Movie \(index)",
//                                       "Bio": "This is a bio for Movile \(index).",
//                                       "Rating": index%2 == 0 ? "PG-13": "PG",
//                                       "Poster": "\(index)"]
//                
//             
//                movies.append(Movie(withJSON: movieDictionary))
//            }
//        }
//        
//        return movies
//    }

}
