//
//  SearchBarTableViewCell.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/4/22.
//

import UIKit
class SearchBarTableViewCell: UITableViewCell {
  static let reuseIdentifier = "searchCell"
  lazy var searchBar: UISearchController = {
    let search = UISearchController()
    search.searchBar.placeholder = "Search coffee"
    search.searchBar.barTintColor = .blue
    search.searchBar.searchTextField.backgroundColor = .white
    return search
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(searchBar.searchBar)
    searchBar.searchBar.backgroundColor = .red
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupConstraint() {
    searchBar.searchBar.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      searchBar.searchBar.searchTextField.topAnchor.constraint(equalTo: searchBar.searchBar.topAnchor, constant: 16),
      searchBar.searchBar.searchTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      searchBar.searchBar.searchTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      searchBar.searchBar.searchTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
    ])
  }

}
