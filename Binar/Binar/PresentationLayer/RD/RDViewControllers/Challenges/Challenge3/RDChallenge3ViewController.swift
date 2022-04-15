//
//  RDViewController.swift
//  Binar
//
//  Created by Raden Dimas on 15/03/22.
//

import UIKit

final class RDChallenge3ViewController: UIViewController {
    var name: String?
    private var displayedAnimals: [Animal] = Animal.listV2()
    private var filteredAnimals = [Animal]()

    private lazy var animalTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var searchAnimalController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Animals ..."
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.scopeButtonTitles = ["All","carnivora","herbivora","omnivora"]
        searchController.searchBar.delegate = self
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        navigationItem.searchController = searchAnimalController
        setupTableView()
    }

    private func setupTableView() {
        animalTableView.delegate = self
        animalTableView.dataSource = self
        animalTableView.register(RDAnimalListCell.self, forCellReuseIdentifier: "rdCellId")

        view.addSubview(animalTableView)

        NSLayoutConstraint.activate([
            animalTableView.topAnchor.constraint(equalTo: view.topAnchor),
            animalTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            animalTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            animalTableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])

    }

    private func reloadDataTableView() {
        let animals: [Animal] = Animal.listV2()
        displayedAnimals = animals
        animalTableView.reloadData()
    }

    private func filteredAnimalByType(search searchText: String, filter scope: String = "All") {
        filteredAnimals = displayedAnimals.filter({ (animal: Animal) -> Bool in
            let typeCategory = (scope == "All") || (animal.typeOfFood.rawValue == scope)

            if isSearchBarEmpty() {
                return typeCategory
            } else {
                return typeCategory && animal.name.lowercased().contains(searchText.lowercased())
            }
        })
        animalTableView.reloadData()
    }

    private func isSearchBarEmpty() -> Bool {
        return searchAnimalController.searchBar.text?.isEmpty ?? true
    }

    private func isFiltering() -> Bool {
        let searchBarIsFiltering = searchAnimalController.searchBar.selectedScopeButtonIndex != 0
        return searchAnimalController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
}

extension RDChallenge3ViewController: UISearchBarDelegate,UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar

        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]

        filteredAnimalByType(search: searchController.searchBar.text!, filter: scope)
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filteredAnimalByType(search: searchBar.text!, filter: searchBar.scopeButtonTitles![selectedScope])
    }

//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        tableView.endEditing(true)
//        reloadDataTableView()
//    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
//        let isSearchTextNotEmpty = !_searchText.isEmpty
//        let animals: [Animal] = Animal.listV2()
//        if isSearchTextNotEmpty {
//            let searchedAnimals: [Animal] = animals.filter {
//                let _searchText: String = searchText.lowercased()
//                let _name: String = $0.name.lowercased()
//                return _name.contains(_searchText)
//            }
//            displayedAnimals = searchedAnimals
//        }
//        else{
//            displayedAnimals = animals
//        }
//        tableView.reloadData()
//    }
    

}

extension RDChallenge3ViewController: UITableViewDelegate,UITableViewDataSource {

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() { return filteredAnimals.count }
        return displayedAnimals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rdCell = tableView.dequeueReusableCell(withIdentifier: "rdCellId", for: indexPath)
        guard let cell = rdCell as? RDAnimalListCell else {
            return rdCell
        }

        let currentAnimals: Animal

        if isFiltering() {
            currentAnimals = filteredAnimals[indexPath.row]
        } else {
            currentAnimals = displayedAnimals[indexPath.row]
        }

        cell.fill(with: currentAnimals)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = self.delete(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete])

        return swipe
    }

//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = self.delete(rowIndexPathAt: indexPath)
//        let edit = self.edit(rowIndexPathAt: indexPath)
//        let swipe = UISwipeActionsConfiguration(actions: [delete,edit])
//
//        return swipe
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = RDDetailViewController()
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        detailVC.animalDetail = animal
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    private func delete(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_ , _, _) in
            guard let self = self else { return }
            self.displayedAnimals.remove(at: indexPath.row)
            self.animalTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return action
    }

//    private func edit(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
//        var textfieldText: UITextField?
//        let action = UIContextualAction(style: .normal, title: "Edit") { [weak self] (_, _, _) in
//            guard let self = self else { return }
//            var animalSelected = self?.displayedAnimals[indexPath.row].name
//            let updateAlert = UIAlertController(title: "Do you want to edit?", message: "Edit name of animal selected.", preferredStyle: .alert)
//            let updateAction = UIAlertAction(title: "Update", style: .default) { [weak self] (action) in
//                let updateName = textfieldText?.text
//                self?.displayedAnimals[indexPath.row].name = updateName!
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            }
//
//            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
//                print("cancel")
//            }
//            updateAlert.addAction(updateAction)
//            updateAlert.addAction(cancelAction)
//
//            updateAlert.addTextField { (textfield) in
//                textfieldText = textfield
//                textfieldText?.placeholder = animalSelected
//                textfieldText?.text = animalSelected
//            }
//
//            self?.present(updateAlert, animated: true, completion: nil)
//        }
//
//        return action
//    }

}
