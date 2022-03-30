//
//  ADAnimalViewController.swift
//  Binar
//
//  Created by Aiedyl Dava Akbari on 25/03/22.
//

import UIKit

class ADAnimalViewController: UIViewController {

    @IBOutlet var animalImg: UIImageView!
    @IBOutlet var animalName: UILabel!
    @IBOutlet var animalDesc: UILabel!
    @IBOutlet var animalFood: UILabel!
    @IBOutlet var animalStr: UILabel!
    
    var animal:Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalName.text = animal?.name
        animalDesc.text = animal?.description
        animalFood.text = "\((animal?.typeOfFood)!)"
        animalStr.text = "\((animal?.strength)!)"
        animalImg.loadImage(resource: animal?.photoUrlString)
        
    }
    


}
