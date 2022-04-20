//
//  IGCreatedAtLabel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 20/04/22.
//

import UIKit

final class IGCreatedAtLabel: UIView {
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 12)
        view.textColor = .secondarySystemBackground
        view.textAlignment = .center
        return view
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
    
    // 45m -> 45 minutes
    // more than 1 hour, ignore minutes
    // 2h -> 2 hours
    // more than 24 hour, ignore hours
    // 10d -> 10 days
    // more than 30 days, ignore days
    // 20 April 2022
    func configure(date: Date) {
    }
}
