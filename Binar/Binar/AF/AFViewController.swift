//
//  AFViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 3/16/22.
//

import UIKit

class AFViewController: UIViewController {
  var name: String?
  var animal: [Animal] = Animal.listV2()
  let searchController = UISearchController()
  let tableView = UITableView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      configureNavigation()
      configureTableview()
      
        // Do any additional setup after loading the view.
    }
  
  private func configureNavigation() {
    self.navigationItem.title = "Animal"
    self.navigationItem.searchController = searchController
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func configureTableview() {
    self.setTableViewDelegate()
    self.setSearchViewDelegate()
    
    searchController.searchBar.placeholder = "Search animal name"
    
    self.tableView.frame = view.frame
    self.tableView.separatorColor = .clear
    self.tableView.register(AFTableViewCell.self, forCellReuseIdentifier: AFTableViewCell.reuseIdentifier)
    
    self.view.addSubview(tableView)
    self.setConstraint()
  }
  
  private func setTableViewDelegate() {
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }
  
  private func setSearchViewDelegate() {
    searchController.searchResultsUpdater = self
    searchController.delegate = self
    searchController.searchBar.delegate = self
  }
  
  
}

// MARK: UISearchController
extension AFViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
  func updateSearchResults(for searchController: UISearchController) {
    guard let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
    
    let isAnimalNotEmpty = !searchText.isEmpty
    let defaultAnimal = animal.sorted { $0.name < $1.name }
    if isAnimalNotEmpty {
      let animal: [Animal] = Animal.listV2().filter {
        let searchTextLower = searchText.lowercased()
        let animal = $0.name.lowercased()
        return animal.contains(searchTextLower)
      }
      self.animal = animal
    } else {
      self.animal = defaultAnimal
    }
    tableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    let animal: [Animal] = Animal.listV2().sorted { $0.name < $1.name }
    self.animal = animal
    tableView.reloadData()
  }

}

// MARK: UITableViewDelegate
extension AFViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animal.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AFTableViewCell.reuseIdentifier, for: indexPath) as? AFTableViewCell else { return UITableViewCell() }
    let row = indexPath.row
    
    let data = animal[row]
    
    cell.fill(with: data)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
  
}

extension AFViewController {
  func setConstraint() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}
