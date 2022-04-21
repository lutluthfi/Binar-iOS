//
//  RoundButton.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 06/04/22.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
