//
//  ChallengeViewController.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class ChallengeViewController: UIViewController {
    @IBOutlet weak var challengeImageView: UIImageView!
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChallengeImageView()
        title = "Challenge Chapter 3"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupChallengeImageView() {
        self.challengeImageView.image = UIImage(named: Animal.listV1().randomElement()!)
        self.challengeImageView.contentMode = .scaleAspectFill
    }
    
    @IBAction func onAddTouchUpInside(_ sender: UIButton) {
        arithmeticOperation()
    }
    
    
    private func arithmeticOperation() {
//        guard firstNumberTextField.text! != nil else {return}
        let firstNum: Int = Int(firstNumberTextField.text ?? "0") ?? 0
        
//        guard secondNumberTextField.text! != nil else {return}
        let secondNum: Int = Int(secondNumberTextField.text ?? "0") ?? 0
        
        guard !firstNumberTextField.text!.isEmpty && !secondNumberTextField.text!.isEmpty else {
            let alert = UIAlertController(title: "Alert", message: "Please fill in the blank text field.", preferredStyle: .alert)
            
            let okay = UIAlertAction(title: "Okay", style: .destructive)
            
            alert.addAction(okay)
            
            present(alert, animated: true)
            
            return
        }
        
        let res: Int = firstNum + secondNum
        
        resultLabel.text = String(res)
        self.challengeImageView.image = UIImage(named: Animal.listV1().randomElement()!)
    }

}

