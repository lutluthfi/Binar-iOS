//
//  BIListViewController.swift
//  Binar
//
//  Created by Bagas Ilham on 22/05/22.
//

import UIKit

@available(iOS 14.0, *)
final class BIListViewController: UITableViewController {
    
    let challenges: [[String]] = [
        ["Challenge 4"],
        ["Challenge 3", "Challenge 4"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BIHomeCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return challenges.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Binar Challenge"
        case 1:
            return "Facil Challenge"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BIHomeCell", for: indexPath)
        
        cell.textLabel?.text = (challenges[section])[row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        switch section {
            
        case 0:
            switch row {
            case 0:
                let vc = BICharacterViewController()
                navigationController?.pushViewController(vc, animated: true)
            default:
                return
            }
            
        case 1:
            switch row {
            case 0:
                let vc = BITabBarViewController()
                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = BIAnimalViewController()
                navigationController?.pushViewController(vc, animated: true)
            default:
                return
            }
        default:
            return
        }
    }
    
}
