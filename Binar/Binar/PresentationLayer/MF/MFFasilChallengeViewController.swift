//
//  FasilChallenge.swift
//  Binar
//
//  Created by Maulana Frasha on 17/03/22.
//

import UIKit

final class MFFasilChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var animalList = Animal.listV1()
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        sortButton.setImage(UIImage(systemName: "arrow.up.arrow.down.circle"), for: .normal)
        sortButton.layer.cornerRadius = 5
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        
        cell.textLabel?.text = animalList[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func sortButtonTap(_ sender: Any) {
        
        let title = sortButton.titleLabel?.text
        
        switch title {
        case "Sort":
            sortButton.setTitle("Z-A", for: .normal)
            animalList = animalList.sorted().reversed()
            tableView.reloadData()
        case "Z-A":
            sortButton.setTitle("A-Z", for: .normal)
            animalList = animalList.sorted()
            tableView.reloadData()
        default:
            sortButton.setTitle("Z-A", for: .normal)
            animalList = animalList.sorted().reversed()
            tableView.reloadData()
        }
    }
}


