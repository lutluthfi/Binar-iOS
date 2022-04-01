//
//  UIViewController+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 01/04/22.
//

import UIKit

extension UIViewController {
    func enableHideKeyboardGesture() {
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(onHideKeyboardTapGesture)
        )
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func onHideKeyboardTapGesture() {
        view.endEditing(true)
    }
}
