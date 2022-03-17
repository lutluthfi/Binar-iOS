//
//  BIViewController.swift
//  Binar
//
//  Created by Bagas on 17/03/22.
//

import UIKit

final class BIViewController: UITableViewController {
    @IBOutlet weak var AnimalSearchBar: UISearchBar!
    @IBOutlet weak var randomAnimal: UIBarButtonItem!
    var name: String?


    @IBAction func onRandomizeTouchUpInside(_ sender: UIButton) {
        let randomAnimal: String = Animal.list.randomElement()!.lowercased()
        let alertController = UIAlertController(title: "Wow!", message: "You are a \(randomAnimal)!", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Great!", style: .default)
        alertController.addAction(cancel)
                
        present(alertController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name! + " Animal List"
    }
    var selectedAnimal: Animal?
    var displayedAnimals: [String] = Animal.list
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

extension BIViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let animalSearchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !animalSearchText.isEmpty
        let animals: [String] = Animal.list
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = animals.filter {
                let animalSearch: String = animalSearchText.lowercased()
                let animalName: String = $0.lowercased()
                return animalName.contains(animalSearch)
            }
            displayedAnimals = searchedAnimals
        } else {
            displayedAnimals = animals
        }
        tableView.reloadData()
    }
    
}
