//
//  BINewsSearchViewController.swift
//  Binar
//
//  Created by Bagas on 07/04/22.
//

import UIKit

final class BINewsSearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.searchBar.isHidden = false
        navigationItem.searchController?.searchBar.placeholder = "Channels, Topics, & Stories"
    }
    
}

