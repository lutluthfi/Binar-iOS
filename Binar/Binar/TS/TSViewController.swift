//
//  TSViewController.swift
//  Binar
//
//  Created by Tatang Sulaeman on 15/03/22.
//

import UIKit

class TSViewController: UIViewController {

    

    @IBOutlet weak var tableView: UITableView!
    
    var selectedChallenge: Challenge?
    enum Challenge: String, CaseIterable{
        case ChallengeAnimal
        case Challenge4
        
        static var sorted: [Challenge] {
            Challenge.allCases.sorted {
                $0.rawValue < $1.rawValue
            }.map { $0 }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    private func open(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension TSViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfChallenge: Int = Challenge.sorted.count
        return numberOfChallenge
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TSTableViewCell", for: indexPath)
        let row: Int = indexPath.row
        let titleChallenge: String = Challenge.sorted[row].rawValue
        cell.textLabel?.text = titleChallenge
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let challenge: Challenge = Challenge.sorted[row]
        
        switch challenge {
        case .ChallengeAnimal:
            goToTSAnimalViewController()
        case .Challenge4:
            goToTSChallenge4ViewController()
        }
    }
}

extension TSViewController {
    func goToTSAnimalViewController() {
        let storyboard = UIStoryboard(name: "TSAnimal", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "TSAnimalViewController") as? TSAnimalViewController else {
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToTSChallenge4ViewController() {
        let storyboard = UIStoryboard(name: "TSChallenge4", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "TSChallenge4ViewController") as? TSChallenge4ViewController else {
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
    }

}
