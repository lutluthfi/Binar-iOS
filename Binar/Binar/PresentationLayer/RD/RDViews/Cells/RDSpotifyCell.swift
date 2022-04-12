//
//  RDSpotifyCell.swift
//  Binar
//
//  Created by Raden Dimas on 12/04/22.
//

import UIKit


final class RDSpotifyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
