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
    var selectedAnimal: Animal?
    var displayedAnimals: [String] = Animal.listV1().sorted()
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let animalCount: Int = displayedAnimals.count
        return animalCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)

        cell.textLabel?.text = displayedAnimals[indexPath.row]
        
        return cell
    }

    @IBAction func onRandomizeTouchUpInside(_ sender: UIButton) {
        let randomAnimal: String = Animal.listV1().randomElement()!.lowercased()
        let alertController = UIAlertController(title: "Wow!", message: "You are a \(randomAnimal)!", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Great!", style: .default)
        alertController.addAction(cancel)
                
        present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name! + "'s Animal List"
    }

}

extension BIViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let animalSearchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !animalSearchText.isEmpty
        let animals: [String] = Animal.listV1()
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = animals.filter {
                let animalSearchText: String = searchText.lowercased()
                let animalName: String = $0.lowercased()
                return animalName.contains(animalSearchText)
            }
            displayedAnimals = searchedAnimals
        } else {
            displayedAnimals = animals
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.endEditing(true)
    }
}
