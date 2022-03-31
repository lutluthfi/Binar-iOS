//
//  BIAnimalTableCell.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class BIAnimalTableCell: UITableViewCell {
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fill(with animal: Animal) {
        animalImageView.loadImage(resource: animal.photoUrlString)
        animalNameLabel.text = animal.name
    }
}
