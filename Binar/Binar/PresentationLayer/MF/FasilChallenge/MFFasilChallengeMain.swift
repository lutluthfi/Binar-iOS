//
//  MFFasilChallengeMain.swift
//  Binar
//
//  Created by Maulana Frasha on 01/04/22.
//

import UIKit

final class MFFasilChallengeMain : UITableViewController {
    
    enum FasilChallenge: String, CaseIterable, TitleEnum {
        case FasilChallenge1
        case FasilChallenge2
        
        static var sorted: [FasilChallenge] {
            FasilChallenge.allCases.sorted { $0.rawValue < $1.rawValue }
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
    
    var selectedChallenge: FasilChallenge?
    var displayedChallenge: [FasilChallenge] = FasilChallenge.sorted
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let challengeCount: Int = displayedChallenge.count
        return challengeCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FasilChallengeCell", for: indexPath)
        
        let row: Int = indexPath.row
        let challenge: FasilChallenge = displayedChallenge[row]
        cell.textLabel?.text = challenge.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let row: Int = indexPath.row
        selectedChallenge = displayedChallenge[row]

        switch selectedChallenge {
        case .FasilChallenge1:
            goToChallenge1()
        case .FasilChallenge2:
            goToChallenge2()
        default:
            break
        }

    }
    
}


extension MFFasilChallengeMain {
    func goToChallenge1(){
        guard let selectedChallenge = selectedChallenge else {return}
        let storyboard = UIStoryboard(name: "MFMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MFFasilChallenge1VC") as? MFFasilChallenge1VC else {
            return
        }
        viewController.name = selectedChallenge.name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToChallenge2(){
        guard let selectedChallenge = selectedChallenge else {return}
        let storyboard = UIStoryboard(name: "MFMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MFFasilChallenge2VC") as? MFFasilChallenge2VC else {
            return
        }
        viewController.name = selectedChallenge.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}
