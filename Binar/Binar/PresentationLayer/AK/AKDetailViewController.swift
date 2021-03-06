//
//  AKDetailViewController.swift
//  Binar
//
//  Created by Adrian K on 24/03/22.
//

import UIKit

class AKDetailViewController: UIViewController {
    var animalName: String?
    var animalUrl: String?
    var animalDescription: String?
    var animalTipe: Animal.TypeOfFood?
    var animalStat: Int?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.loadImage(resource: animalUrl)
        titleLabel.text = "\((animalName)!)"
        typeLabel.text = "\((animalTipe)!)"
        descriptionLabel.text = "\((animalDescription)!)"
        statusLabel.text = "\((animalStat)!)"
        descriptionLabel.sizeToFit()
        descriptionLabel.numberOfLines = 0
    }
}

