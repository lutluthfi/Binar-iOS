//
//  BinarChallenge.swift
//  Binar
//
//  Created by Maulana Frasha on 17/03/22.
//

import UIKit

final class BC: UIViewController {
    
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var hasil: UILabel!
    @IBOutlet weak var gambar: UIImageView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        a.keyboardType = .numberPad
        b.keyboardType = .numberPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func hitung(_ sender: Any) {
        let a = Int(a.text!)
        let b = Int(b.text!)
        let total = a! + b!
        hasil.text = String(total)
        
        let img1 = UIImage(systemName: "sun.min")
        let img2 = UIImage(systemName: "moon")
        let img3 = UIImage(systemName: "cloud")
        let randomImage = [img1, img2, img3]
        
        gambar.image = randomImage.randomElement()!!
        
    }
}
