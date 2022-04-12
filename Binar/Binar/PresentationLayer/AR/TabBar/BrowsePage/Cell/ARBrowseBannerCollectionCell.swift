//
//  ARBrowseBannerCollectionCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 05/04/22.
//

import UIKit

final class ARBrowseBannerCollectionCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
             $0.topAnchor.constraint(equalTo: self.contentView.topAnchor),
             $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)]
        }
    }
    
    func fill(with imageUrl: String?) {
        imageView.loadImage(resource: imageUrl)
    }
}

