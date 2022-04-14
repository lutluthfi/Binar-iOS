//
//  BIAddAnimalViewController.swift
//  Binar
//
//  Created by Bagas on 27/03/22.
//

import UIKit

class AddAnimalViewController: UIViewController{
    @IBOutlet weak var newAnimalNameTextField: UITextField!
    @IBOutlet weak var newAnimalDescTextField: UITextField!
    @IBOutlet weak var newAnimalStrengthTextField: UITextField!
    @IBOutlet weak var newAnimalImageTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func onCancelButtonTouch(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onAddButtonTouch(_ sender: UIButton) {
        newAnimalName = newAnimalNameTextField.text
        newAnimalDetail = newAnimalDescTextField.text
        newAnimalStrength = Int(newAnimalStrengthTextField.text!)
        newAnimalUrl = newAnimalImageTextField.text
        print(newAnimalName!)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a new animal"
    }
}
