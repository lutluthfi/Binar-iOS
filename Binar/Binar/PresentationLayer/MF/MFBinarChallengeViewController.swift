//
//  BinarChallenge.swift
//  Binar
//
//  Created by Maulana Frasha on 17/03/22.
//

import UIKit

final class MFBinarChallengeViewController: UIViewController {
    
    @IBOutlet weak var valueALabel: UITextField!
    @IBOutlet weak var valueBLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        valueALabel.keyboardType = .numberPad
        valueBLabel.keyboardType = .numberPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func summary(_ sender: Any) {
        let valueA = Int(valueALabel.text!) ?? 0
        let valueB = Int(valueBLabel.text!) ?? 0
        let summary = valueA + valueB
        resultLabel.text = String(summary)
        imageView.loadImage(resource: "https://picsum.photos/200")
        
    }
}


