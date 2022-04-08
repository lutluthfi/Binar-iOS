//
//  ADAnimalViewCellViewTableViewCell.swift
//  Binar
//
//  Created by Aiedyl Dava Akbari on 25/03/22.
//

import UIKit

class ADAnimalViewCellViewTableViewCell: UITableViewCell {

    @IBOutlet var animalImg: UIImageView!
    @IBOutlet var animalName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
