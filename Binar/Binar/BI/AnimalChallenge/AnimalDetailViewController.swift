//
//  AnimalDetailViewControlller.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class BIAnimalDetailViewController: UIViewController{
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescLabel: UILabel!
    
    var name: String?
    var desc: String?
    var typeOfFood: Animal.TypeOfFood?
    var strength: Int?
    var imageUrlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name!.capitalized + " Detail"
        animalNameLabel.text = name
        animalDescLabel.text = desc! + "\n\n" +
        "Type of Food\t: \(typeOfFood!) \n" +
        "Strength\t\t: \(strength!)"
        animalImageView.loadImage(resource: imageUrlString)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
