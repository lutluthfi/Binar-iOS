//
//  DPCostumTableViewCell.swift
//  Binar
//
//  Created by Dimas Purnomo on 08/05/22.
//

import UIKit

class DPCostumTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
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
