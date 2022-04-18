//
//  DBTableViewCell.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 08/04/22.
//

import UIKit

class DBTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func fill(with animal: Animal) {
        photoImageView.loadImage(resource: animal.photoUrlString)
        titleLabel.text = animal.name
    }
}

    
