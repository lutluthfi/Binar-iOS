import UIKit

final class RNViewController: UITableViewController {
    
    @IBOutlet weak var animalSearchBar: UISearchBar!
    
    var name : String?
    var listAnimals: [String] = Animal.list.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let displayAnimals : Int = listAnimals.count
          return displayAnimals
      }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)

        cell.textLabel?.text = listAnimals[indexPath.row]
        
        return cell
    }

}

extension RNViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let findAnimal: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !findAnimal.isEmpty
        let animals: [String] = Animal.list.sorted()
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = animals.filter {
                let findAnimal : String = findAnimal.lowercased()
                let animal = $0.lowercased()
                return animal.contains(findAnimal)
            }
            listAnimals = searchedAnimals
            
        } else {
            listAnimals = animals
        }
        tableView.reloadData()
    }
    
}
