//
//  AFViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 3/16/22.
//

import UIKit

class AFViewController: UIViewController {
  enum Course: String, CaseIterable, CodingKey {
    case ChallengeChapter3 = "Challenge 3"
    case ChallengeBinarChapter3 = "Challenge Binar Chapter 3"
    case ChallengeChapter4 = "Challenge 4"
  }
  
  let tableView: UITableView = {
    let tableView = UITableView()
    
    return tableView
  }()
  
  override func loadView() {
    super.loadView()
    
    setupView()
    
  }
  
  func setupView() {
    setupTableView()
    setupDelegate()
    view.addSubview(tableView)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "afCell")
  }
  
  func setupDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func setupTableView() {
    tableView.frame = view.bounds
  }
}

extension AFViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Course.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "afCell", for: indexPath)
    let row: Int = indexPath.row
    let course: String = Course.allCases[row].rawValue
    cell.textLabel?.text = course
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row: Int = indexPath.row
    let course: Course = Course.allCases[row]
    
    switch course {
    case .ChallengeChapter3:
      let vc  = AFChallengeListV2()
      open(viewController: vc)
    case .ChallengeBinarChapter3:
      let vc = AFChallengeBinarViewController()
      open(viewController: vc)
    case .ChallengeChapter4:
      let vc = Challenge4TableViewController()
      open(viewController: vc)
    }
    
  }
  
  private func open(viewController: UIViewController) {
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}
