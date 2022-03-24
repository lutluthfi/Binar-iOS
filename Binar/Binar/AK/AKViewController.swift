//
//  AKViewController.swift
//  Binar
//
//  Created by Adrian K on 15/03/22.
//

import UIKit

final class AKViewController: UITableViewController {
    
    @IBOutlet weak var shuffleButton: UIButton!
    
    var name: String?
    var count = 0
    
    var animalAll: [String] = [Animal.listV1()].self[0].sorted()
    var displayedAnimals: [String] = [Animal.listV1()][0].sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name

    }
    
    
    @IBAction func onShuffleButtonTap(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Message", message: "Are you sure want to shuffle ?", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(cancel)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { action in
            self.animalAll.shuffle()
            self.tableView.reloadData()
        }
        alertController.addAction(confirm)
        present(alertController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalCount: Int = animalAll.count
        return animalCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)
        let row: Int = indexPath.row
        let animal = animalAll[row]
        cell.textLabel?.text = animal
        
        return cell
    }
    
    
}

extension AKViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !_searchText.isEmpty
        let animals = displayedAnimals
        if isSearchTextNotEmpty {
            let searchedAnimals = animals.filter{
                let _searchText: String = searchText.lowercased()
                let _name: String = $0.lowercased()
                return _name.contains(_searchText)
            }
            animalAll = searchedAnimals
        }else{
            animalAll = animals
        }
        tableView.reloadData()
    }
    
}




