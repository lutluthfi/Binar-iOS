//
//  ARAnimalTableCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 23/03/22.
//

import UIKit

final class ARAnimalTableCell: UITableViewCell {
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
