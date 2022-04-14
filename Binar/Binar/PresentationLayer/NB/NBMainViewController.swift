//
//  NBMainViewController.swift
//  Binar
//
//  Created by nurin berlianna on 14/04/22.
//

import UIKit

final class NBMainViewController: UITableViewController {
    
    enum challenge: String, CaseIterable, TitleEnum {
        case FasilChallenge1
        case calculator
        
        
        static var sorted: [challenge] {
            challenge.allCases.sorted { $0.rawValue < $1.rawValue }
        }
        
        var name: String {
            var res: String = ""
            var secondWordIndex: Int = 0
            for (index, char) in rawValue.enumerated() {
                secondWordIndex = index
                if char.isUppercase && secondWordIndex != 0 {
                    res += " \(char)"
                } else {
                    res += String(char)
                }
            }
            return res
        }
    }
    
    var selectedChallenge: challenge?
    var displayedChallenge: [challenge] = challenge.sorted
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return  displayedChallenge.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath)
        
        let row: Int = indexPath.row
        let challenge: challenge = displayedChallenge[row]
        cell.textLabel?.text = challenge.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        selectedChallenge = displayedChallenge[row]
        
        switch selectedChallenge {
        case .FasilChallenge1:
            goToChallenge1()
        case .calculator:
            goToCalculator()
        default:
            break
        }
        
        
    }
    
}

extension NBMainViewController {
    func goToChallenge1() {
        let storyboard = UIStoryboard(name: "NBMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "NBViewController") as? NBViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    func goToCalculator () {
        let storyboard = UIStoryboard(name: "NBMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "challenge3ViewController") as? challenge3ViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
