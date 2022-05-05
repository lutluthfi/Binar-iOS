//
//  DBTableViewCell.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 07/04/22.
//

import UIKit

class DBTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func fill(with animal: Animal) {
        photoImage.loadImage(resource: animal.photoUrlString)
        labelText.text = animal.name
        
    }
    
}
