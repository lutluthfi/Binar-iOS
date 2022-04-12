//
//  IGUsernameLabel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGUsernameLabel: UIView {
    typealias OnTap = () -> Void
    
    private lazy var textLabel = UILabel()
    
    var onTap: OnTap?
    
    func configure(username: String) {
        
    }
}
