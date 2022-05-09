//
//  BIViewController.swift
//  Binar
//
//  Created by Bagas on 17/03/22.
//

import UIKit

final class BIViewController: UITableViewController {
    
    let binarChallengeArray: [String] = ["Challenge Chapter 3","Challenge Chapter 4"]
    let facilChallengeArray: [String] = ["Animal Challenge", "News Challenge"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .singleLine
        
    }
    
    override init(style: UITableView.Style) {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return binarChallengeArray.count
            
        case 1:
            return facilChallengeArray.count
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let array = [binarChallengeArray,facilChallengeArray]
        
        cell.textLabel?.text = (array[indexPath.section])[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Binar Challenge"
        case 1:
            return "Facil Challenge"
        default:
            return " "
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        switch section {
        case 0:
            switch row {
            case 0:
                navigationController?.pushViewController(BIChallengeChapter3VC(), animated: true)
            case 1:
                navigationController?.pushViewController(CharacterViewController(), animated: true)
            default:
                return
            }
            
        case 1:
            switch row {
            case 0:
                navigationController?.pushViewController(BIAnimalTableViewController(style: .insetGrouped), animated: true)
            case 1:
                navigationController?.pushViewController(BITabBarViewController(), animated: true)
            default:
                return
            }
            
        default:
            return
            
        }
    }
    
}
