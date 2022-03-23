//
//  MFAnimalTableCellTableViewCell.swift
//  Binar
//
//  Created by Maulana Frasha on 24/03/22.
//

import UIKit

class MFAnimalTableCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellData(with animal: Animal){
        imageViewCell.loadImage(resource: animal.photoUrlString)
        titleLabel.text = animal.name
        subtitleLabel.text = animal.description
    }
}
