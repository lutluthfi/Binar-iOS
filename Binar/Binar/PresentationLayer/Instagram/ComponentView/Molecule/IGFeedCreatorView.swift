//
//  IGFeedCreatorView.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 20/04/22.
//

import UIKit

final class IGFeedCreatorView: UIView {
    typealias OnTap = () -> Void
    
    private lazy var avatarImageView = IGAvatarImageView()
    private lazy var usernameLabel = IGUsernameLabel()
    
    private let avatarSizeType = IGAvatarImageView.SizeType.small
    
    var onAvatarImageViewTap: OnTap? {
        get { avatarImageView.onTap }
        set { avatarImageView.onTap = newValue }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubview()
        setupConstraint()
    }
    
    private func setupAddSubview() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
    }
    
    private func setupConstraint() {
        avatarImageView.makeConstraint(builder: {
            $0.widthAnchor.constraint(equalToConstant: self.avatarSizeType.rawValue)
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            $0.topAnchor.constraint(equalTo: self.topAnchor)
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        })
        usernameLabel.makeConstraint(builder: {
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            $0.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        })
    }
    
    func configure(username: String, avatarUrlString: String) {
        usernameLabel.configure(username: username)
        avatarImageView.configure(sizeType: avatarSizeType, urlString: avatarUrlString)
    }
}
