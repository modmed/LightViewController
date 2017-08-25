//
//  MoviesCollectionViewController.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 8/25/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

class MoviesCollectionViewController: UIViewController {
    
    @IBOutlet weak var moviesCollection : UICollectionView!
    
    let moviesController = MoviesController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadMovies()

        self.title = "Collection View Test"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMovies()
    {
        self.moviesController.loadMovies {
            self.moviesCollection.reloadData()
        }
    }


}

extension MoviesCollectionViewController : UICollectionViewDelegate
{
    
}

extension MoviesCollectionViewController : UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.moviesController.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var cell : UICollectionViewCell
        
        switch self.moviesController.moviesAction(index: indexPath.row)
        {
        case .showMovie:
            cell = self.moviesCollection.dequeueReusableCell(withReuseIdentifier: "Movie Collection Cell", for: indexPath)
            (cell as! MovieCollectionViewCell).update(withMovie: self.moviesController.movie(index: indexPath.row))
            break

        case .loadMoreMovies:
            cell = self.moviesCollection.dequeueReusableCell(withReuseIdentifier: "Movie Collection Loading Cell", for: indexPath)
            self.loadMovies()
            break

        case .loadingMoreMovies:
            cell = self.moviesCollection.dequeueReusableCell(withReuseIdentifier: "Movie Collection Loading Cell", for: indexPath)
            break
            
        }
        
        return cell
    }
}
