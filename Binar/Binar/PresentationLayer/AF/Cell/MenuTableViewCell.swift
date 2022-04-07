//
//  MenuTableViewCell.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/5/22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
  static let reuseIdentifier = "menuTableViewCell"
  let listMenu: [String] = ["Hot Coffee", "Cold Coffe", "Others"]
  let hotCoffee: [HotCoffee] = CoffeeShop.listCoffe().hotCoffee
  let coldCoffee: [ColdCoffee] = CoffeeShop.listCoffe().coldCoffee
  let others: [Others] = CoffeeShop.listCoffe().others
  lazy var rowsToDisplay: [ProtocolHotCoffee] = hotCoffee
  lazy var segmentedControl: UISegmentedControl = {
    let segmented = UISegmentedControl(items: listMenu)
    segmented.backgroundColor = .white
    segmented.selectedSegmentIndex = 0
    segmented.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
    return segmented
  }()
  
  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.backgroundColor = .clear
    searchBar.placeholder = "Jangan cari yang aneh aneh dah"
    searchBar.sizeToFit()
    return searchBar
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.separatorStyle = .none
    
    return tableView
  }()
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    
    return stack
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    let image: UIImageView = UIImageView().loadImage(resource: CoffeeShop.listCoffe().urlMainImage)
    configView()
    contentView.backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func handleSegmentChange() {
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      rowsToDisplay = hotCoffee
      print(segmentedControl.selectedSegmentIndex)
      tableView.reloadData()
    case 1:
      rowsToDisplay = coldCoffee
      print(segmentedControl.selectedSegmentIndex)
      tableView.reloadData()
    default:
      rowsToDisplay = others
      print(segmentedControl.selectedSegmentIndex)
      tableView.reloadData()
    }
  }
  
  func configView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    searchBar.delegate = self
    
    tableView.frame = bounds
    tableView.register(Challenge4TableViewCell.self, forCellReuseIdentifier: "segmentedListCell")
    
    stackView.addArrangedSubview(segmentedControl)
    stackView.addArrangedSubview(searchBar)
    stackView.addArrangedSubview(tableView)
    contentView.addSubview(stackView)
    
    setConstraint()
  }
  
  func setConstraint() {
    stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//    stackView.makeConstraint([
//      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
//      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//    ])
  }

}

extension MenuTableViewCell: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
    return rowsToDisplay.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "segmentedListCell", for: indexPath) as? Challenge4TableViewCell else { return UITableViewCell() }
    cell.selectionStyle = .none
    cell.fill(coffee: rowsToDisplay[indexPath.row])
    return cell
  }

}

extension MenuTableViewCell: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
    print("searchBarTextDidBeginEditing")
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    let searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    let isMenuNotEmpty = !searchText.isEmpty
    let defaultMenu = rowsToDisplay.sorted { $0.name < $1.name }
    if isMenuNotEmpty {
      let searchedMenu: [ProtocolHotCoffee] = rowsToDisplay.filter {
        let searchTextlower = searchText.lowercased()
        let menu = $0.name.lowercased()
        return menu.contains(searchTextlower)
      }
      rowsToDisplay = searchedMenu
    } else {
      rowsToDisplay = defaultMenu
    }
    tableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = false
    searchBar.text = ""
    let menu: [ProtocolHotCoffee] = rowsToDisplay.sorted { $0.name < $1.name }
    rowsToDisplay = menu
    tableView.endEditing(true)
    
    tableView.reloadData()
  }
  
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    tableView.reloadData()
    return true
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print("searchBarSearchButtonClicked")
  }
  
}
