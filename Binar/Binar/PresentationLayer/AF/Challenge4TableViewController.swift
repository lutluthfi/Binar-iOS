//
//  Challenge4TableViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/4/22.
//

import UIKit

class Challenge4TableViewController: UITableViewController {
  
  lazy var headerView: UIView = {
    let heaader = UIView()
    heaader.contentMode = .scaleAspectFill
    heaader.clipsToBounds = true
    return heaader
  }()
  
  lazy var imageView: UIImageView = {
    let image = UIImageView()
    
    return image
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    tableView.register(MenuTableViewCell.self,
                       forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
    
    configTableView()
    
  }
  
  
  func configTableView() {
    tableView.separatorStyle = .none
    guard let imageUrl = URL(string: CoffeeShop.listCoffe().urlMainImage) else { return }
    guard let imageData = try? Data(contentsOf: imageUrl) else { return }
    imageView =  UIImageView(image: UIImage(data: imageData))
    imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
    
    
    headerView.addSubview(imageView)
    tableView.backgroundView = headerView
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier, for: indexPath)
    cell.backgroundColor = .white
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(tableView.frame.height)
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = -scrollView.contentOffset.y
    self.headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: y)
  }
}

extension Challenge4TableViewController {
  
}
