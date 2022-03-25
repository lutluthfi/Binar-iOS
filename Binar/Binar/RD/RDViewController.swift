//
//  RDViewController.swift
//  Binar
//
//  Created by Raden Dimas on 15/03/22.
//

import UIKit

final class RDViewController: UIViewController {
    var name: String?
    private var displayedAnimals: [String] = Animal.listV1().sorted()
    
    private let tableView: UITableView = {
          let tv = UITableView()
          tv.backgroundColor = UIColor.white
          tv.separatorColor = UIColor.white
          tv.translatesAutoresizingMaskIntoConstraints = false
          return tv
      }()

    private let searchVC = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItem()
        setupTableView()
        createSearchBar()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AnimalListCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])

    }
    
    private func createSearchBar() {
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
    
    private func reloadDataTableView() {
        let animals: [String] = Animal.listV1().sorted()
        displayedAnimals = animals
        tableView.reloadData()
    }
    
    private func setupNavigationBarItem() {
        navigationItem.title = name
        let sortedBtn = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(onAddBarButtonItemTap))
        
        navigationItem.rightBarButtonItems = [sortedBtn]
    }
    
    @objc func onAddBarButtonItemTap(_ sender: UIBarButtonItem) {
        displayedAnimals = Animal.listV1().sorted().reversed()
        tableView.reloadData()
    }
    
}

extension RDViewController: UISearchBarDelegate {
        
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.endEditing(true)
        reloadDataTableView()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !_searchText.isEmpty
        let animals: [String] = Animal.listV1().sorted()
        if isSearchTextNotEmpty {
            let searchedAnimals: [String] = animals.filter {
                let _searchText: String = searchText.lowercased()
                let _name: String = $0.lowercased()
                return _name.contains(_searchText)
            }
            displayedAnimals = searchedAnimals
        }
        else{
           displayedAnimals = animals
        }
        tableView.reloadData()
    }
}

extension RDViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedAnimals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AnimalListCell
        cell.backgroundColor = UIColor.white
        cell.animalLabel.text = displayedAnimals[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Touch", message: "You touching a \(displayedAnimals[indexPath.row])!", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Back", style: .destructive)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

class AnimalListCell: UITableViewCell {
    
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var animalLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(animalLabel)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        animalLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        animalLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animalLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        animalLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
    }
    
}
