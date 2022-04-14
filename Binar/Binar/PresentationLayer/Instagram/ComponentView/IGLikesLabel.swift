//
//  IGLikesLabel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

// 1. if 0 number -> 0 like
// 2. if 1 number -> 1 like
// 3. if n number -> n likes
// 4. if n number where n / 1000 -> n.xx likes (number format)
final class IGLikesLabel: UIView {
    private lazy var textLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // add subview
        // constraint
        // setup view -> color, format, etc
    }
    
    func configure(_ numberOfLikes: Int) {
        // process to render
    }
}
