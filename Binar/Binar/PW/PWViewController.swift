//
//  PWViewController.swift
//  Binar
//
//  Created by user on 15/03/22.k
//

import UIKit

class PWViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    struct AnimalName {
        let tilte: String
        let imageName: String
    }
    
    
    var data: [AnimalName] = [];

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        
       
        
        let elm = Animal.list
        let mirror = Mirror(reflecting: elm)
        for child in mirror.children  {
            data.append(AnimalName(tilte: child.value as! String, imageName: "\(child.value).jpg"))
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let animal = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.label.text = animal.tilte
        
        cell.iconImageView.image = UIImage(named: animal.imageName) ?? UIImage(named: "150x150")
//        let url = URL(string:  animal.imageName)!
//        cell.iconImageView.kf.setImage(with: url)
//        if let data = try? Data(contentsOf: url) {
//            // Create Image and Update Image View
//
//        }
    
        
        return cell
    }


}


