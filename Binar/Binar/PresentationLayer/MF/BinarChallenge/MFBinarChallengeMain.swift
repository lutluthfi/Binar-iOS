//
//  MFBinarChallengeMain.swift
//  Binar
//
//  Created by Maulana Frasha on 01/04/22.
//

import UIKit

final class MFBinarChallengeMain : UITableViewController {
    
    enum BinarChallenge: String, CaseIterable, TitleEnum {
        case BinarChallenge1
        
        static var sorted: [BinarChallenge] {
            BinarChallenge.allCases.sorted { $0.rawValue < $1.rawValue }
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
    
    var selectedChallenge: BinarChallenge?
    var displayedChallenge: [BinarChallenge] = BinarChallenge.sorted
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let challengeCount: Int = displayedChallenge.count
        return challengeCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BinarChallengeCell", for: indexPath)
        
        let row: Int = indexPath.row
        let challenge: BinarChallenge = displayedChallenge[row]
        cell.textLabel?.text = challenge.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let row: Int = indexPath.row
        selectedChallenge = displayedChallenge[row]

        switch selectedChallenge {
        case .BinarChallenge1:
            goToChallenge1()
        default:
            break
        }

    }
    
}

extension MFBinarChallengeMain {
    func goToChallenge1(){
        guard let selectedChallenge = selectedChallenge else {return}
        let storyboard = UIStoryboard(name: "MFMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MFBinarChallenge3VC") as? MFBinarChallenge3VC else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
