//
//  MovieTableViewCell.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 6/16/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var poster: UIImageView!

    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var bio : UILabel!
    @IBOutlet weak var rating : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(withMovie movie: Movie)
    {
        self.title.text = movie.title
        self.bio.text = movie.bio
        self.rating.text = movie.rating
        
        poster.image = UIImage.imageFromText(text: "\(movie.id)")
    }

}
