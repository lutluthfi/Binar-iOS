//
//  MenuTableViewCell.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/5/22.
//

import UIKit

protocol PushViewController {
  func goToDetailCell(sender: IndexPath, data: ProtocolHotCoffee)
}

class MenuTableViewCell: UITableViewCell {
  static let reuseIdentifier = "menuTableViewCell"
  var delegate: PushViewController?
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
    searchBar.placeholder = "Type here to find your menu"
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
    tableView.isScrollEnabled = false
    tableView.register(Challenge4TableViewCell.self, forCellReuseIdentifier: "segmentedListCell")
    
    stackView.addArrangedSubview(segmentedControl)
    stackView.addArrangedSubview(searchBar)
    stackView.addArrangedSubview(tableView)
    contentView.addSubview(stackView)
    
    setConstraint()
  }
  
  func setConstraint() {
    stackView.translatesAutoresizingMaskIntoConstraints = false 
    stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.goToDetailCell(sender: indexPath, data: rowsToDisplay[indexPath.row])
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
    searchBar.endEditing(true)
    let menu: [ProtocolHotCoffee] = rowsToDisplay.sorted { $0.name < $1.name }
    rowsToDisplay = menu
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
