//
//  DBTableViewCell.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 07/04/22.
//

import UIKit

class DBTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var LabelTextAnimal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(with animal: Animal) {
        photoImageView.loadImage(resource: animal.photoUrlString)
        LabelTextAnimal.text = animal.name
    }
    
}
