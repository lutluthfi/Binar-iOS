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
    @IBOutlet weak var like: UIButton!
    
    @IBOutlet weak var outpulLike: UILabel!
    
    @IBAction func likeoutput(_ sender: Any) {
        if runningNumber.count <= 0 {
            outpulLike.text = runningNumber
        }
    }
    
    var result = "0"
    var runningNumber = "0"
    
    override func awakeFromNib() {
        super.awakeFromNib()
          outpulLike.text = "0"
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
