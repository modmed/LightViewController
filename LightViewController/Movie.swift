//
//  Movies.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 6/16/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

class Movie{
    
    let id : String
    let title : String
    let rating : String
    let bio : String
    let poster : UIImage
    
    init (withJSON json : Dictionary<String, String>)
    {
        self.id = json["Id"]!
        self.title = json["Title"]!
        self.rating = json["Rating"]!
        self.bio = json["Bio"]!
        self.poster = UIImage.imageFromText(text: json["Id"]!)
    }

}
