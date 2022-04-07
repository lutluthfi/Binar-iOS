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
  var hotCoffee: [HotCoffee] = CoffeeShop.listCoffe().hotCoffee.sorted { $0.name < $1.name }
  let coldCoffee = CoffeeShop.listCoffe().coldCoffee
  let others = CoffeeShop.listCoffe().others.map { $0 }
//  var dict: [String: Any] =
  lazy var segmentedControl: UISegmentedControl = {
    let segmented = UISegmentedControl(items: listMenu)
    segmented.backgroundColor = .white
    segmented.selectedSegmentIndex = 0
//    segmented.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
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
  
//  @objc func handleSegmentChange() {
//    switch segmentedControl.selectedSegmentIndex {
//    case 0:
//      rowsToDisplay = hotCoffee
//    case 1:
//      rowsToDisplay = coldCoffee
//    default:
//      rowsToDisplay = others
//    }
//  }
  
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
    stackView.makeConstraint([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
    ])
  }

}

extension MenuTableViewCell: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
    return hotCoffee.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "segmentedListCell", for: indexPath) as? Challenge4TableViewCell else { return UITableViewCell() }
    cell.selectionStyle = .none
    cell.fill(coffee: hotCoffee[indexPath.row])
    return cell
  }

}

extension MenuTableViewCell: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
    print("searchBarTextDidBeginEditing")
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("textDidChange")
    let searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    let isMenuNotEmpty = !searchText.isEmpty
    let defaultMenu = hotCoffee.sorted { $0.name < $1.name }
    if isMenuNotEmpty {
      let searchedMenu: [HotCoffee] = hotCoffee.filter {
        let searchTextlower = searchText.lowercased()
        let menu = $0.name.lowercased()
        return menu.contains(searchTextlower)
      }
      hotCoffee = searchedMenu
    } else {
      hotCoffee = defaultMenu
    }
    tableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = false
    searchBar.text = ""
    let menu: [HotCoffee] = hotCoffee.sorted { $0.name < $1.name }
    hotCoffee = menu
    print(menu)
    
    tableView.reloadData()
  }
  
}
