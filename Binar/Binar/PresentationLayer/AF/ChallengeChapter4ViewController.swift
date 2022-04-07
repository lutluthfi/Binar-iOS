////
////  ChallengeChapter4ViewController.swift
////  Binar
////
////  Created by Adji Firmansyah on 4/2/22.
////
//
//import UIKit
//
//class ChallengeChapter4ViewController: UIViewController {
//  let tableView: UITableView = {
//    let tv = UITableView()
//    tv.register(Challenge4TableViewCell.self, forCellReuseIdentifier: Challenge4TableViewCell.reuseIdentifier)
//    tv.separatorStyle = .none
//    return tv
//  }()
//
//  let searchTableView: UITableView = {
//    let search = UITableView()
//    search.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
//    search.separatorStyle = .none
//
//    return search
//  }()
//
//  override func loadView() {
//    super.loadView()
//    setupView()
//  }
//
//  func setupView() {
//
//    setupDelegate()
//    setupTableView()
//    view.addSubview(searchTableView)
//    view.addSubview(tableView)
//  }
//
//  func setupDelegate() {
//    searchTableView.delegate = self
//    searchTableView.dataSource = self
//
//    tableView.delegate = self
//    tableView.dataSource = self
//
//  }
//
//  func setupTableView() {
//    searchTableView.frame = view.bounds
//    tableView.frame = view.bounds
//  }
//
//}
//
//extension ChallengeChapter4ViewController: UITableViewDelegate, UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    if tableView == searchTableView {
//      return 1
//    }
//    return CoffeeShop.listCoffe().count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    if tableView == searchTableView {
//      guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
//      return cell
//    } else {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellFour", for: indexPath) as? Challenge4TableViewCell else { return UITableViewCell() }
//    let row = indexPath.row
//    let coffee = CoffeeShop.listCoffe()[row]
//    cell.fill(coffee: coffee)
//
//    return cell
//    }
//  }
//
//}
//
//extension ChallengeChapter4ViewController {
//  func readLocalJSONFile(forName name: String) -> Data? {
//      do {
//          if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
//              let fileUrl = URL(fileURLWithPath: filePath)
//              let data = try Data(contentsOf: fileUrl)
//              return data
//          }
//      } catch {
//          print("error: \(error)")
//      }
//      return nil
//  }
//}
