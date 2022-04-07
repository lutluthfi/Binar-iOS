//
//  StretchyViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/3/22.
//

import UIKit

class StretchyViewController: UIViewController {
  
  let tableView: UITableView = {
    let tb = UITableView()
    tb.backgroundColor = .systemGray
    tb.register(UITableViewCell.self, forCellReuseIdentifier: "stretchy")
    return tb
  }()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setupView()
      view.backgroundColor = .red
      
    }
  
  func setupView() {
    setupDelegate()
    view.addSubview(tableView)
  }
  
  func setupDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.frame = view.bounds
  }
}

extension StretchyViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Animal.listV1().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stretchy", for: indexPath)
    let data = Animal.listV1()[indexPath.row]
    cell.textLabel?.text = data
    cell.backgroundColor = .green
    
    return cell
  }
  
}
