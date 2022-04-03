//
//  UIView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 25/03/22.
//

import UIKit

extension UIView {
    func makeConstraint(completion: @escaping (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        let _constraints: [NSLayoutConstraint] = completion(self)
        NSLayoutConstraint.activate(_constraints)
    }
    
    func remakeConstraint(completion: @escaping (UIView) -> [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = false }
        makeConstraint(completion: completion)
    }
    
    func rounded(cornerRadius: CGFloat) {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}
