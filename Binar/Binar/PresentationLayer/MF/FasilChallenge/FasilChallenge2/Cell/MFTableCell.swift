//
//  MFTableCell.swift
//  Binar
//
//  Created by Maulana Frasha on 01/04/22.
//

import UIKit

class MFTableCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellData(with animal: Animal){
        imageViewOutlet.loadImage(resource: animal.photoUrlString)
        titleLabel.text = animal.name
        subtitleLabel.text = animal.description
    }
    
}
