//
//  AIAnimalTableViewController.swift
//  Binar
//
//  Created by Akbar on 21/03/22.
//

import UIKit

  final class AIAnimalTableViewController: UITableViewController {
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableViewAnimal: UITableView!
    
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
          let alertController = UIAlertController(title: "Hii!", message: "You are a \(randomAnimal)!", preferredStyle: .alert)
          
          let cancel = UIAlertAction(title: "Good Jobs!", style: .default)
          alertController.addAction(cancel)
                  
          present(alertController, animated: true)
      }
      
      override func viewDidLoad() {
          super.viewDidLoad()
        title = "Name's Animal List"
      }

  }

  extension AIAnimalTableViewController: UISearchBarDelegate {

      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          let animalSearchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
          let isSearchTextNotEmpty = !animalSearchText.isEmpty
          let animals: [String] =  Animal.listV1()
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
