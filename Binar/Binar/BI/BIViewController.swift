//
//  BIViewController.swift
//  Binar
//
//  Created by Bagas on 17/03/22.
//

import UIKit

final class BIViewController: UITableViewController {
    @IBOutlet weak var AnimalSearchBar: UISearchBar!
    var name: String?
    var selectedAnimal: Animal?
    var displayedAnimals: [String] = Animal.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalCount: Int = displayedAnimals.count
        return animalCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)

        cell.textLabel?.text = Animal.list[indexPath.row]
        
        return cell
    }
}

//extension BIViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        
//    }
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        tableView.endEditing(true)
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
//        let isSearchTextNotEmpty = !_searchText.isEmpty
//        let animals: [String] = Animal.list
//        if isSearchTextNotEmpty {
//            let searchedAnimals: [String] = animals.filter {
//                let _searchText: String = searchText.lowercased()
//                let _name: String = list.lowercased()
//                return _name.contains(_searchText)
//            }
//            displayedAnimals = searchedAnimals
//        } else {
//            displayedAnimals = animals
//        }
//        tableView.reloadData()
//    }
//}
