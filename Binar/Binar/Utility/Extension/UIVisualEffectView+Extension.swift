//
//  UIVisualEffectView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 04/04/22.
//

import UIKit

extension UIVisualEffectView {
    static func makeBlur(for effect: UIBlurEffect.Style) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: effect)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }
}
