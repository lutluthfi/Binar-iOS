//
//  RobotsTableViewCell.swift
//  Binar
//
//  Created by user on 25/03/22.
//

import UIKit

class RobotsTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageRobots: UIImageView!
    @IBOutlet weak var iconStrength: UIImageView!
    @IBOutlet weak var labelFood: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func fill(with animal: Animal) {
        imageRobots.loadImage(resource: animal.photoUrlString)
        labelTitle.text = animal.name
        labelFood.text = "Carnivora"
        
    }
    
}
