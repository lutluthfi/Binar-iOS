//
//  IGAvatarImageView.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/15/22.
//

import UIKit

final class IGAvatarImageView: UIView {
    typealias OnTap = () -> Void
    
    enum SizeType: CGFloat {
        case small = 32
        case medium = 40
        case large = 64
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .secondarySystemBackground
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageViewTapped))
        return view
    }()
    private var imageWidthConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    
    private var sizeType: SizeType = .small
    
    var onTap: OnTap?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(sizeType: SizeType, urlString: String) {
        self.sizeType = sizeType
        let sizeValue: CGFloat = sizeType.rawValue
        let cornerRad: CGFloat = sizeValue / 2
        imageView.rounded(cornerRadius: cornerRad)
        imageView.loadImage(resource: urlString)
        imageWidthConstraint?.constant = sizeValue
        imageHeightConstraint?.constant = sizeValue
    }
    
    @objc private func onImageViewTapped(_ gesture: UITapGestureRecognizer) {
        onTap?()
    }
    
    private func setupConstraint() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor).isActive = true
        imageWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: sizeType.rawValue)
        imageWidthConstraint?.isActive = true
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: sizeType.rawValue)
        imageHeightConstraint?.isActive = true
    }
}
