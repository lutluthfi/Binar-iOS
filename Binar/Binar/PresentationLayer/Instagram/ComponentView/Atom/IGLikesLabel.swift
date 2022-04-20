//
//  IGLikesLabel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGLikesLabel: UIView {
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        return view
    }()
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
        addSubview(textLabel)
        textLabel.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]}
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
