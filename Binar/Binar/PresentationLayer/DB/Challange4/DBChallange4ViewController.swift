//
//  DBChallange4.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 04/04/22.
//

import UIKit

enum Operation:String {
case Add = "+"
case Substract = "-"
case Divide = "/"
case multyply = "*"
case Null = "Null"

}
class DBChallange4ViewController: UIViewController {

    @IBOutlet weak var OutputLbl: UILabel!
    
    
var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
    OutputLbl.text = "0"
    }

    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
        runningNumber += "\(sender.tag)"
        OutputLbl.text = runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: RoundButton) {
    
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
        runningNumber += ","
        OutputLbl.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender:  RoundButton) {
    operation(operation: currentOperation)
    }
   
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Substract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .multyply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    func operation(operation: Operation) {
        if currentOperation != .Null {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Substract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .multyply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
               leftValue = result
                OutputLbl.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
       
             }
           }
        }

   
