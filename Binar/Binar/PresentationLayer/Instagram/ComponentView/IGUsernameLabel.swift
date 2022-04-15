//
//  IGUsernameLabel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGUsernameLabel: UIView {
    typealias OnTap = () -> Void
    
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTextLabelTapped))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    var onTap: OnTap?
    
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
    
    @objc private func onTextLabelTapped(_ gesture: UITapGestureRecognizer) {
        onTap?()
    }
    
    func configure(username: String) {
        var _username = username
        _username.removeAll { $0 == "@" }
        textLabel.text = "@\(_username)"
    }
}
