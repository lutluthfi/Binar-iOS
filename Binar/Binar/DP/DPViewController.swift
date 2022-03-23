//
//  DPViewController.swift
//  Binar
//
//  Created by Dimas Purnomo on 15/03/22.
//

import UIKit

final class DPViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonAZ: UIButton!
    
    @IBAction func buttonAZ(_ sender: Any) {
        let title = buttonAZ.titleLabel?.text
        
        switch title {
        case "Sort":
            buttonAZ.setTitle("Z-A", for: .normal)
            displayAnimals = displayAnimals.sorted().reversed()
            tableView.reloadData()
        case "Z-A":
            buttonAZ.setTitle("A-Z", for: .normal)
            displayAnimals = displayAnimals.sorted()
            tableView.reloadData()
        default:
            buttonAZ.setTitle("Z-A", for: .normal)
            displayAnimals = displayAnimals.sorted().reversed()
            tableView.reloadData()
        }
    }
    
    var displayAnimals: [String] = Animal.listV1()
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
}

extension DPViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayAnimals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalsTableCell", for: indexPath)
        
        cell.textLabel?.text = displayAnimals[indexPath.row]
        return cell
    }
}

extension DPViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !_searchText.isEmpty
        let animals: [String] = Animal.listV1().sorted()
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = animals.filter {
                let _searchText: String = searchText.lowercased()
                let _name: String = $0.lowercased()
                return _name.contains(_searchText)
            }
            displayAnimals = searchedAnimals
        } else {
            displayAnimals = animals
        }
        tableView.reloadData()
    }
}



