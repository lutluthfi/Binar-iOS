//
//  ATViewController.swift
//  Binar
//
//  Created by Nuzulul Athaya on 17/03/22.
//

import UIKit

final class ATViewController: UITableViewController {

    @IBOutlet weak var searchAnimalBar: UISearchBar!
    
    var name : String?
    
    var selectedAnimal: Animal?
    
    var displayAnimals: [String] = Animal.listV1().sorted()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let displayAnimals : Int = displayAnimals.count
          return displayAnimals
      }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)

        cell.textLabel?.text = displayAnimals[indexPath.row]
        
        return cell
    }
}
    extension ATViewController: UISearchBarDelegate {
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let findAnimal: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            let isSearchTextNotEmpty = !findAnimal.isEmpty
            let animals: [String] = Animal.listV1().sorted()
            if isSearchTextNotEmpty {
                let searchedAnimals: [String] = animals.filter {
                    let findAnimal : String = findAnimal.lowercased()
                    let animal = $0.lowercased()
                    return animal.contains(findAnimal)
                }
                displayAnimals = searchedAnimals
                
            } else {
                displayAnimals = animals
            }
            tableView.reloadData()
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

