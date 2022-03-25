//
//  UIView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 25/03/22.
//

import UIKit

extension UIView {
    func makeConstraint(_ constraints: NSLayoutConstraint...) {
        makeConstraint(constraints)
    }
    
    func makeConstraint(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func rounded(cornerRadius: CGFloat) {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}
