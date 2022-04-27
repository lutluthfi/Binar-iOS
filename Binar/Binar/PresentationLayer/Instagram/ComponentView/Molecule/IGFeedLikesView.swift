//
//  IGFeedLikesView.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 26/04/22.
//

import UIKit

final class IGFeedLikesView: UIView {
    typealias IsLiked = Bool
    typealias OnLikesImageViewTapped = (IsLiked) -> Void
    
    lazy var likesImageView: UIImageView = {
       let view = UIImageView()
        view.isUserInteractionEnabled = true
        view.clipsToBounds = true
        view.image = UIImage(systemName: "heart")
        view.tintColor = .black
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onLikesImageViewTapped))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    lazy var likesLabel = IGLikesLabel()
    
    private var isLiked: IsLiked = false
    
    var onLikesImageViewTap: OnLikesImageViewTapped?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(likesImageView)
        addSubview(likesLabel)
        likesImageView.makeConstraint(builder: {
            $0.widthAnchor.constraint(equalToConstant: 24)
            $0.heightAnchor.constraint(equalToConstant: 24)
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            $0.topAnchor.constraint(equalTo: self.topAnchor)
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        })
        likesLabel.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: self.likesImageView.trailingAnchor, constant: 12)
            $0.centerYAnchor.constraint(equalTo: self.likesImageView.centerYAnchor)
        })
    }
    
    @objc private func onLikesImageViewTapped() {
        isLiked.toggle()
        if isLiked {
            likesImageView.image = UIImage(systemName: "heart.fill")
        } else {
            likesImageView.image = UIImage(systemName: "heart")
        }
        onLikesImageViewTap?(isLiked)
    }
    
    func configure(numberOfLikes: Int) {
        likesLabel.configure(numberOfLikes)
    }
}
