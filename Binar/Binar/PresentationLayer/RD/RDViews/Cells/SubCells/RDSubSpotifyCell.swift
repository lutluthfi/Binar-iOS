//
//  RDSubSpotifyCell.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit


final class RDSubSpotifyCell: UICollectionViewCell {
    
    var playlist: RDSpotifyPlaylist? {
               didSet {
                guard let playlist = self.playlist else {return}
                   self.cellImageView.image = UIImage(named: playlist.image)
                   self.cellTitleLabel.text = self.playlist?.title
               }
        }
    
    private lazy var cellImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var cellTitleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionCell() {
        addSubview(cellImageView)
        addSubview(cellTitleLabel)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.leftAnchor.constraint(equalTo: leftAnchor),
            cellImageView.rightAnchor.constraint(equalTo: rightAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 150),
            cellImageView.bottomAnchor.constraint(equalTo: cellTitleLabel.topAnchor,constant: -15),
            
            cellTitleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor,constant: 20),
            cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            cellTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
        ])
    }
    
}
