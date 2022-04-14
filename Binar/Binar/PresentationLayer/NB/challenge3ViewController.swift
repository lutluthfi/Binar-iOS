//
//  challenge3ViewController.swift
//  Binar
//
//  Created by nurin berlianna on 14/04/22.
//

import UIKit

var output = Double()
let firstValue = Double()
let secondValue = Double()

class challenge3ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var theAnswer: UILabel!
    @IBOutlet weak var buttonAdd: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 @IBAction func buttonAdd(_ sender: UIButton) {
            let firstValue = Double(textField1.text!)
            let secondValue = Double(textField2.text!)
            
            output = firstValue! + secondValue!
            
           theAnswer.text = String(output)
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
