//
//  CustomTableViewCell.swift
//  Binar
//
//  Created by user on 17/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextView!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }
}
