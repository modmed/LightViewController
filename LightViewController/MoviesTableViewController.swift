//
//  MoviesTableViewController.swift
//  LightViewController
//
//  Created by Ashraf Jaddo on 8/25/17.
//  Copyright © 2017 Modernizing Medicine. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController {

    @IBOutlet weak var moviesTable : UITableView!
    
    let moviesController = MoviesController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Table View Test"
        
        self.loadMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadMovies()
    {
        self.moviesController.loadMovies {
            self.moviesTable.reloadData()
        }
    }
}

extension MoviesTableViewController : UITableViewDelegate
{
    
}

extension MoviesTableViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.moviesController.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell
        
        switch self.moviesController.moviesAction(index: indexPath.row)
        {
        case .showMovie:
            cell = self.moviesTable.dequeueReusableCell(withIdentifier: "Movie Table Cell", for: indexPath)
            (cell as! MovieTableViewCell).update(withMovie: self.moviesController.movie(index: indexPath.row))
            break
            
        case .loadMoreMovies:
            cell = self.moviesTable.dequeueReusableCell(withIdentifier: "Movie Table Loading Cell", for: indexPath)
            self.loadMovies()
            break
            
        case .loadingMoreMovies:
            cell = self.moviesTable.dequeueReusableCell(withIdentifier: "Movie Table Loading Cell", for: indexPath)
            break
            
        }
        
        return cell
        
    }
}

