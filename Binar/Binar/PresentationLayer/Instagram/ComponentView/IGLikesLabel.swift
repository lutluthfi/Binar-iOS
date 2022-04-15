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
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // add subview
        // constraint
        // setup view -> color, format, etc
        addSubview(textLabel)
        textLabel.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]}
        textLabel.font = .boldSystemFont(ofSize: 17)
    }
    
    func configure(_ numberOfLikes: Int) {
        var suffix = "like"
        if numberOfLikes > 1 {
            suffix = "likes"
        }
        let _numberOfLikes = formatter.string(from: numberOfLikes as NSNumber) ?? String(numberOfLikes)
        textLabel.text = "\(_numberOfLikes) \(suffix)"
    }
}
