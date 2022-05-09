//
//  DPChapter3ViewController.swift
//  Binar
//
//  Created by Dimas Purnomo on 08/05/22.
//

import UIKit
import SwiftUI

class DPChapter3ViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var valueA: UITextField!
    @IBOutlet weak var valueB: UITextField!
    
    @IBOutlet weak var resultValue: UILabel!

    
    @IBAction func clickResult(_ sender: Any) {
        let valueA = Int(valueA.text!) ?? 0
        let valueB = Int(valueB.text!) ?? 0
        let result = valueA + valueB
        resultValue.text = String(result)

        let img1 = UIImage(systemName: "book.fill")
        let img2 = UIImage(systemName: "pencil")
        let img3 = UIImage(systemName: "calendar")
        let randomImage = [img1, img2, img3]

        images.image = randomImage.randomElement()!!
    }
    
    override func viewDidLoad() {
        title = "Challenge 3 - Course"
        
        valueA.keyboardType = .numberPad
        valueB.keyboardType = .numberPad
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
