//
//  TSAnimalTableCell.swift
//  Binar
//
//  Created by Tatang Sulaeman on 25/03/22.
//

import UIKit

class TSAnimalTableCell: UITableViewCell {

    @IBOutlet weak var photoUi: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func fill(with animal: Animal) {
        photoUi.loadImage(resource: animal.photoUrlString)
        titleLabel.text = animal.name
        descriptionLabel.text = animal.description
    }
    
}
