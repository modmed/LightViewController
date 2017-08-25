//
//  MovieCollectionViewCell.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 8/25/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var title : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(withMovie movie: Movie)
    {
        self.title.text = movie.title
        poster.image = UIImage.imageFromText(text: "\(movie.id)")
    }
}
