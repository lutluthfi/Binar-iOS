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
    var selectedAnimal: String?
    var displayedAnimals: [String] = Animal.listV1().sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name! + "'s Animal List"
    }
    
    
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
        let randomAnimal: String?
        randomAnimal = Animal.listV1().randomElement()!
        
        let alertController = UIAlertController(title: "More Actions", message: "What do you want to do?", preferredStyle: .actionSheet)
        
        let sortAsc = UIAlertAction(title: "Sort Ascending", style: .default) { _ in
            self.displayedAnimals = self.displayedAnimals.sorted{$0 < $1}
            self.tableView.reloadData()
        }
        
        let sortDesc = UIAlertAction(title: "Sort Descending", style: .default) { _ in
            self.displayedAnimals = self.displayedAnimals.sorted{$0 > $1}
            self.tableView.reloadData()
        }
        
        let random = UIAlertAction(title: "Generate Random Animal", style: .default) { _ in
            let singular: String?
            guard let initial = randomAnimal!.first?.lowercased() else {return}
            if initial == "a" || initial == "e" || initial == "i" || initial == "o" || initial == "u" {
                singular = "an "
            } else {
                singular = "a "
            }
            let randomAlertController = UIAlertController(title: "Wow!", message: "You are \(singular!)\(randomAnimal!.lowercased())!", preferredStyle: .alert)
            
                guard let selectedAnimal = randomAnimal else { return }
                let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "AnimalDetailViewController") as? AnimalDetailViewController else {return}
                viewController.name = selectedAnimal
            self.navigationController?.pushViewController(viewController, animated: true)
            
            let great = UIAlertAction(title: "Great!", style: .destructive)
            
            randomAlertController.addAction(great)
            
            self.present(randomAlertController, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(sortAsc)
        alertController.addAction(sortDesc)
        alertController.addAction(random)
        alertController.addAction(cancel)
                
        present(alertController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        selectedAnimal = displayedAnimals[row]
        for animal in Animal.listV1() {
            switch selectedAnimal{
            case animal:
                guard let selectedAnimal = selectedAnimal else { return }
                let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "AnimalDetailViewController") as? AnimalDetailViewController else {return}
                viewController.name = selectedAnimal
                navigationController?.pushViewController(viewController, animated: true)

            default:
            break
            }
        }
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

final class AnimalDetailViewController: UIViewController{
    var name: String?
    var detail: String?
    var urlString: String?
    @IBOutlet weak var AnimalNameLabel: UILabel!
    @IBOutlet weak var AnimalDetailLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    
    func introduction() {
        let singular: String?
        guard let initial = name!.first?.lowercased() else {return}
        if initial == "a" || initial == "e" || initial == "i" || initial == "o" || initial == "u" {
            singular = "an "
        } else {
            singular = "a "
        }
        detail = "This is " + singular! + name!.lowercased() + "."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimalImageView()
        introduction()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = name
        AnimalNameLabel.text = name
        AnimalDetailLabel.text = detail
    }
    
    private func setupAnimalImageView() {
        
        self.animalImageView.image = UIImage(named: name!)
    }
}
