//
//  THAnimalTableCell.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 3/25/22.
//

import UIKit

class THAnimalTableCell: UITableViewCell {
    @IBOutlet weak var animalPicImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(with animal: Animal) {
        animalPicImageView.loadImage(resource: animal.photoUrlString)
        animalNameLabel.text = animal.name
    }
    
}
