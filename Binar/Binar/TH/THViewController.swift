//
//  THViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 3/15/22.
//

import UIKit


final class THViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var animalList: [String] = Animal.listV1().sorted { $0 < $1 }
    var groupedDisplayedAnimals: [[String]] = [[String]]()
    var headerTitles: [String] = [String]()
    var name: String?

    
    func makeArray2d(from array1d: [String]) -> [[String]]{
        return array1d.reduce(into: []) {
            if $0.last?.last?.prefix(1) == $1.prefix(1) {
                $0[$0.index(before: $0.endIndex)].append($1)
            } else {
                $0.append([$1])
            }
        }
    }
    
    func getFirstLetterArray(from array: [String]) -> [String]{
        var res: [String] = [String]()
        for item in array {
            if !res.contains("\(item.first!)"){
                res.append("\(item.first!)")
            }
        }
        return res
    }
    func reloadAnimalList(){
        groupedDisplayedAnimals = makeArray2d(from: animalList)
        headerTitles = getFirstLetterArray(from: animalList)
        tableView.reloadData()
    }
    
    func reloadAnimalList(_ newAnimalList: [String]){
        groupedDisplayedAnimals = makeArray2d(from: newAnimalList)
        headerTitles = getFirstLetterArray(from: newAnimalList)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        groupedDisplayedAnimals = makeArray2d(from: animalList)
        headerTitles = getFirstLetterArray(from: animalList)
//        print(groupedDisplayedAnimals)
    }
    
    // MARK: Add data table view
    @IBAction func tapAddButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Animal", message: "Type animal name", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Animal name"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(cancel)
        
        let confirm = UIAlertAction(title: "add", style: .default) { [self] action in
            guard alertController.textFields?.isEmpty == false else { return }
            let textField: UITextField? = alertController.textFields?[0]
            guard let _textField = textField else { return }
            let text: String? = _textField.text
            animalList.append(text!.capitalized)
            animalList = animalList.sorted { $0 < $1 }
            reloadAnimalList()
        }
        alertController.addAction(confirm)
        present(alertController, animated: true)
    }
}

// MARK: Insert array to table
extension THViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedDisplayedAnimals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedDisplayedAnimals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animalName = groupedDisplayedAnimals[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        cell.textLabel?.text = animalName
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        return nil
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return headerTitles
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animalName = groupedDisplayedAnimals[indexPath.section][indexPath.row]
        let alertController = UIAlertController(title: "Edit Animal", message: "Edit animal data", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Animal name"
            textField.text = animalName
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        let delete = UIAlertAction(title: "Delete", style: .default) { [self] action in
            if let index = animalList.firstIndex(of: animalName) {
                animalList.remove(at: index)
            }
            animalList = animalList.sorted { $0 < $1 }
            reloadAnimalList()
        }
        
        let save = UIAlertAction(title: "Save", style: .default) { [self] action in
            guard alertController.textFields?.isEmpty == false else { return }
            let textField: UITextField? = alertController.textFields?[0]
            guard let _textField = textField else { return }
            let text: String? = _textField.text
            animalList.append(text!.capitalized)
            if let index = animalList.firstIndex(of: animalName) {
                animalList.remove(at: index)
            }
            animalList = animalList.sorted { $0 < $1 }
            reloadAnimalList()
        }
        
        alertController.addAction(save)
        alertController.addAction(delete)
        alertController.addAction(cancel)
        present(alertController, animated: true)
        
    }
}

// MARK: Search data table
extension THViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !_searchText.isEmpty
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = animalList.filter {
                let _searchText: String = searchText.lowercased()
                let _name: String = $0.lowercased()
                return _name.contains(_searchText)
            }
            reloadAnimalList(searchedAnimals)
        }
        else{
            reloadAnimalList()
        }
    }
}




