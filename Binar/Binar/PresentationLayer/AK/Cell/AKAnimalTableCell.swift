//
//  AKAnimalTableCell.swift
//  Binar
//
//  Created by Adrian K on 24/03/22.
//

import UIKit

class AKAnimalTableCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fill(with animal: Animal) {
        photoImageView.loadImage(resource: animal.photoUrlString)
        titleLabel.text = animal.name
    }
    
}
