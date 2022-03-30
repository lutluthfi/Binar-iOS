//
//  DSViewController.swift
//  Binar
//
//  Created by Daffashiddiq on 17/03/22.
//

import UIKit

class DSViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var animals = Animal.listV1()
    
    var sectionTitle = [String]()
    
    var animalDict = [String: [String]]()
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        filteredData = animals
        // Do any additional setup after loading the view.
        sectionTitle = Array(Set(filteredData.compactMap({String($0.prefix(1))})))
        sectionTitle.sort()
        sectionTitle.forEach({animalDict[$0] = [String]()})
        filteredData.forEach({animalDict[String($0.prefix(1))]?.append($0)})
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

// MARK: TableView
extension DSViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animalDict[sectionTitle[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = animalDict[sectionTitle[indexPath.section]]?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitle[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitle
    }
 // Do Something Here Later
}

// MARK: searchBar
extension DSViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !_searchText.isEmpty
        let filteredData: [String] = animals
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = filteredData.filter {
                let _searchText: String = searchText.lowercased()
                let _name:String = $0.lowercased()
                return _name.contains(_searchText)
            }
            self.sectionTitle = Array(Set(searchedAnimals.compactMap({String($0.prefix(1))})))
            self.sectionTitle.sort()
            self.sectionTitle.forEach({animalDict[$0] = [String]()})
            searchedAnimals.forEach({animalDict[String($0.prefix(1))]?.append($0)})
        } else {
            self.filteredData = filteredData
        }
    
        self.tableView.reloadData()
    }
}
