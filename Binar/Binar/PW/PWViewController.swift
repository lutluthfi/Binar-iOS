//
//  PWViewController.swift
//  Binar
//
//  Created by user on 15/03/22.k
//

import UIKit

class PWViewController: UIViewController, UITableViewDataSource, StoryboardInstantiable {
    
    @IBOutlet weak var table: UITableView!
    
    struct AnimalName {
        let tilte: String
        let imageName: String
        let description: String
    }
    
    
    var data: [AnimalName] = [];

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        
       
        
        let elm = Animal.listV1()
        let mirror = Mirror(reflecting: elm)
        for child in mirror.children  {
            data.append(AnimalName(tilte: child.value as! String, imageName: "\(child.value).jpg", description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."))
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let animal = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.label.text = animal.tilte
        
        let imageView = UIImage(named: animal.imageName) ?? UIImage(named: "150x150")
        
        cell.iconImageView.image = imageView
        cell.iconImageView.layer.masksToBounds = true;
        cell.iconImageView.layer.cornerRadius = 25
        cell.textField.text = animal.description
        cell.textField.clipsToBounds = true;
        cell.textField.layer.cornerRadius = 10
        cell.textField.textContainer.lineFragmentPadding = 10

    
        
        return cell
    }


}


