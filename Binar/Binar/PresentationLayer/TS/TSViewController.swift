//
//  TSViewController.swift
//  Binar
//
//  Created by Tatang Sulaeman on 15/03/22.
//

import UIKit

class TSViewController: UIViewController {

    @IBOutlet weak var animalSearchBar: UISearchBar!
    @IBOutlet weak var animalTable: UITableView!
    
    var selectedAnimal: Animal?
    
    var displayedAnimal: [String] = Animal.listV1().sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalSearchBar.delegate = self
        animalTable.delegate = self
        animalTable.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TSViewController: UITableViewDelegate,UITableViewDataSource {
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalCount: Int = displayedAnimal.count
        return animalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = animalTable.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        cell.textLabel?.text = displayedAnimal[indexPath.row]
        return cell
        
        
    }
    
    
}

extension TSViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        animalTable.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNoEmpty = !_searchText.isEmpty
        let animals: [String] = Animal.listV1().sorted()
        if isSearchTextNoEmpty {
            let searchedAnimal: [String] = animals.filter {
                let _searchText: String = searchText.lowercased()
                let _animal: String = $0.lowercased()
                return _animal.contains(_searchText)
                
            }
            displayedAnimal = searchedAnimal
        } else {
            displayedAnimal = animals
        }
        animalTable.reloadData()
    }
}
