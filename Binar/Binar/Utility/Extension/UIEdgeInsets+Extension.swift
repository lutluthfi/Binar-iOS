//
//  UIEdgeInsets+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 25/04/22.
//

import UIKit

extension UIEdgeInsets {
    init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
