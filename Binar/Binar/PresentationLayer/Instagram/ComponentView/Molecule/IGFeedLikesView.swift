//
//  IGFeedLikesView.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 26/04/22.
//

import UIKit

final class IGFeedLikesView: UIView {
    typealias OnLikesTapped = (Bool) -> Void
    typealias OnBookmarkTapped = (Bool) -> Void
    
    lazy var likesLabel = IGLikesLabel()
    lazy var likesImageView: UIImageView = makeImageView(
        image: UIImage(systemName: "heart"),
        action: #selector(onLikesImageViewTapped)
    )
    lazy var bookmarkImageView: UIImageView = makeImageView(
        image: UIImage(systemName: "bookmark"),
        action: #selector(onBookmarkImageViewTapped)
    )
    
    private var isBookmarked: Bool = false
    private var isLiked: Bool = false
    
    var onBookmarkTap: OnBookmarkTapped?
    var onLikesTap: OnLikesTapped?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(likesImageView)
        addSubview(likesLabel)
        addSubview(bookmarkImageView)
        likesImageView.makeConstraint(builder: {
            $0.widthAnchor.constraint(equalToConstant: 24)
            $0.heightAnchor.constraint(equalToConstant: 24)
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            $0.topAnchor.constraint(equalTo: self.topAnchor)
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        })
        likesLabel.makeConstraint(builder: {
            $0.centerYAnchor.constraint(equalTo: self.likesImageView.centerYAnchor)
            $0.leadingAnchor.constraint(equalTo: self.likesImageView.trailingAnchor, constant: 12)
        })
        bookmarkImageView.makeConstraint(builder: {
            $0.centerYAnchor.constraint(equalTo: self.likesImageView.centerYAnchor)
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        })
    }
    
    @objc private func onBookmarkImageViewTapped() {
        isBookmarked.toggle()
        configureBookmark()
        onBookmarkTap?(isBookmarked)
    }
    
    @objc private func onLikesImageViewTapped() {
        isLiked.toggle()
        if isLiked {
            likesImageView.image = UIImage(systemName: "heart.fill")
        } else {
            likesImageView.image = UIImage(systemName: "heart")
        }
        onLikesTap?(isLiked)
    }
    
    private func configureBookmark() {
        if isBookmarked {
            bookmarkImageView.image = UIImage(systemName: "bookmark.fill")
        } else {
            bookmarkImageView.image = UIImage(systemName: "bookmark")
        }
    }
    
    private func makeImageView(image: UIImage? = nil, action: Selector) -> UIImageView {
        let view = UIImageView()
        view.isUserInteractionEnabled = true
        view.clipsToBounds = true
        view.image = image
        view.tintColor = .black
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(tapGesture)
        return view
    }
}

extension IGFeedLikesView {
    func configure(numberOfLikes: Int, isBookmarked: Bool) {
        self.isBookmarked = isBookmarked
        likesLabel.configure(numberOfLikes)
        configureBookmark()
    }
}
