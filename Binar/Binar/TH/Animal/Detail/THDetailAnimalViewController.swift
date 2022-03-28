//
//  THDetailAnimalViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 3/25/22.
//

import UIKit

class THDetailAnimalViewController: UIViewController {
    var animal: Animal?
    @IBOutlet weak var animalPicImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalTypeOfFoodLabel: UILabel!
    @IBOutlet weak var animalStrengthLabel: UILabel!
    @IBOutlet weak var animalDescLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalPicImageView.loadImage(resource: animal?.photoUrlString)
        animalNameLabel.text = animal?.name
        animalTypeOfFoodLabel.text = "Type of Food : \((animal?.typeOfFood)!)"
        animalStrengthLabel.text = "Strength : \((animal?.strength)!)"
        animalDescLabel.text = animal?.description
        // Do any additional setup after loading the view.
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
