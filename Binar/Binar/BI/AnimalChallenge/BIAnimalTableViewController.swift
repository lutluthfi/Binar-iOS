//
//  BIAnimalTableViewController.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class BIAnimalTableViewController: UITableViewController, StoryboardInstantiable {
    var displayedAnimals: [Animal] = Animal.listV2()
    var selectedAnimal: Animal?
    @IBOutlet weak var animalSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animal List"
        tableView.registerCell(BIAnimalTableCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Animal List"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.title?.removeAll()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "BIAnimalTableCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? BIAnimalTableCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        
        cell.fill(with: animal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        selectedAnimal = displayedAnimals[row]
        for animal in Animal.listV2() {
            switch selectedAnimal?.name{
            case animal.name:
                guard let selectedAnimal = selectedAnimal else { return }
                let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "AnimalDetail") as? AnimalDetail else {return}
                viewController.name = selectedAnimal.name
                viewController.desc = selectedAnimal.description
                viewController.imageUrlString = selectedAnimal.photoUrlString
                viewController.typeOfFood = selectedAnimal.typeOfFood
                viewController.strength = selectedAnimal.strength
                navigationController?.pushViewController(viewController, animated: true)

            default:
            break
            }
            if animal.name == selectedAnimal?.name { break } // prevent loop from opening detail page more than once
        }
    }
    
    // MARK: More Actions Button
    
    @IBAction func onActionsButtonTouchUpInside(_ sender: UIButton) {
        var choice: String?
        let actionsAlert = UIAlertController(title: "More Actions", message: "What do you want to do?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        let sortAlert = UIAlertController(title: "Sorting Method", message: "What sorting method would you prefer?", preferredStyle: .alert)
        
        let sortAscending = UIAlertAction(title: "Sort Ascending", style: .default) { _ in
            self.sortAsc(from: choice!)
        }
        
        let sortDescending = UIAlertAction(title: "Sort Descending", style: .default) { _ in
            self.sortDesc(from: choice!)
        }
        
        sortAlert.addAction(sortAscending)
        sortAlert.addAction(sortDescending)
        sortAlert.addAction(cancel)
        
        let sortByName = UIAlertAction(title: "Sort By Name", style: .default) { _ in
            choice = "name"
            self.present(sortAlert, animated: true)
        }
        
        let sortByStrength = UIAlertAction(title: "Sort By Strength", style: .default) { _ in
            choice = "strength"
            self.present(sortAlert, animated: true)
        }
        
        let random = UIAlertAction(title: "Generate Random Animal", style: .default) { _ in
            let singular: String?
            let animals: [Animal] = Animal.listV2()
            let randomAnimal: Animal? = animals.randomElement()!
            guard let initial = randomAnimal!.name.first?.lowercased() else {return}
            if initial == "a" || initial == "e" || initial == "i" || initial == "o" || initial == "u" {
                singular = "an "
            } else {
                singular = "a "
            }
            let randomAlertController = UIAlertController(title: "Wow!", message: "You are \(singular!)\(randomAnimal!.name.lowercased())!", preferredStyle: .alert)
            
                guard let selectedAnimal = randomAnimal else { return }
                let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "AnimalDetail") as? AnimalDetail else {return}
            viewController.name = selectedAnimal.name
            viewController.desc = selectedAnimal.description
            viewController.imageUrlString = selectedAnimal.photoUrlString
            viewController.typeOfFood = selectedAnimal.typeOfFood
            viewController.strength = selectedAnimal.strength
            self.navigationController?.pushViewController(viewController, animated: true)
            
            let great = UIAlertAction(title: "Great!", style: .cancel)
            
            randomAlertController.addAction(great)
            
            self.present(randomAlertController, animated: true)
        }

        actionsAlert.addAction(sortByName)
        actionsAlert.addAction(sortByStrength)
        actionsAlert.addAction(random)
        actionsAlert.addAction(cancel)
        
        present(actionsAlert, animated: true)
    }
    
}

// MARK: Search Bar Delegate

extension BIAnimalTableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let animalSearchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !animalSearchText.isEmpty
        let animals: [Animal] = Animal.listV2()
        if isSearchTextNotEmpty {
            let searchedAnimals: [Animal] = animals.filter {
                let animalSearchText: String = searchText.lowercased()
                let animalName: String = $0.name.lowercased()
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

// MARK: Sort Ascending and Descending Functions

extension BIAnimalTableViewController {
    func sortAsc(from choice: String) {
        let animals: [Animal] = displayedAnimals
        switch choice{
        case "name":
            displayedAnimals = animals.sorted(by: { $0.name < $1.name })
            
        case "strength":
            displayedAnimals = animals.sorted(by: { $0.strength < $1.strength })
        
        default:
            break
        }
        tableView.reloadData()
    }
    
    func sortDesc(from choice: String) {
        let animals: [Animal] = displayedAnimals
        switch choice{
        case "name":
            displayedAnimals = animals.sorted(by: { $0.name > $1.name })
            
        case "strength":
            displayedAnimals = animals.sorted(by: { $0.strength > $1.strength })
        
        default:
            break
        }
        tableView.reloadData()
    }
}
