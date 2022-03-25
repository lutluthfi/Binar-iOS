//
//  AFViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 3/16/22.
//

import UIKit

class AFViewController: UIViewController {
  var name: String?
  var animal: [String] = Animal.listV1()
  var searchController: UISearchController = {
    let _searchController = UISearchController()
    _searchController.searchBar.placeholder = "Search animal name"
    return _searchController
  }()
  
  var tableView: UITableView = {
    var _tableView = UITableView()
    return _tableView
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setupAllComponent()
      searchController.searchResultsUpdater = self
      searchController.delegate = self
      searchController.searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
  
  func setupAllComponent() {
    navigationItem.title = "Animal"
    navigationItem.searchController = searchController
    navigationController?.navigationBar.prefersLargeTitles = true
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "animalCell")
    self.tableView.frame = view.bounds
    
    view.addSubview(tableView)
  }
  
}

extension AFViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
    
    print(searchText)
    let isAnimalNotEmpty = !searchText.isEmpty
    let defaultAnimal = animal.sorted {$0 < $1}
    if isAnimalNotEmpty {
      let animal: [String] = Animal.listV1().filter {
        let searchTextLower = searchText.lowercased()
        let animal = $0.lowercased()
        return animal.contains(searchTextLower)
      }
      self.animal = animal
    } else {
      self.animal = defaultAnimal
    }
    tableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    let animal: [String] = Animal.listV1().sorted()
    self.animal = animal
    tableView.reloadData()
    
  }

}

extension AFViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animal.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
    let row = indexPath.row
    let data = animal[row]
    cell.textLabel?.text = data
    
    return cell
  }
  
}
