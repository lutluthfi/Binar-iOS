//
//  AKViewController.swift
//  Binar
//
//  Created by Adrian K on 15/03/22.
//

import UIKit

final class AKViewController: UITableViewController {
    enum Challenge: String, CaseIterable, TitleEnum {
        case ChallengeAnimal2
        case ChallengeMirroringApp
        static var sorted: [Challenge] {
            Challenge.allCases.sorted { $0.rawValue < $1.rawValue }
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
    var name: String?
    var selectedChallenge: Challenge?
    var displayedChallenge: [Challenge] = Challenge.sorted
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let studentCount: Int = displayedChallenge.count
        return studentCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeIdentifier", for: indexPath)
        
        let row: Int = indexPath.row
        let challenge: Challenge = displayedChallenge[row]
        cell.textLabel?.text = challenge.name
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let challenge: Challenge = Challenge.sorted[row]
        switch challenge {
            case .ChallengeAnimal2:
                open(AKChallenge2ViewController())
            case .ChallengeMirroringApp:
            let storyboard = UIStoryboard(name: "AKMainChallengeMirror", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "AKTabBarController") as? AKTabBarController else {
                return
            }
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func open(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
