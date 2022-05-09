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
                   self.cellTitleLabel.text = playlist.title
                   self.cellFollowerLabel.text = String(playlist.follower) + " FOLLOWERS"
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
    
    private lazy var cellFollowerLabel : UILabel = {
        let followerLabel = UILabel()
        followerLabel.textColor = UIColor.lightGray
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        return followerLabel
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
        addSubview(cellFollowerLabel)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 250),
            cellImageView.widthAnchor.constraint(equalToConstant: 50),
            cellImageView.bottomAnchor.constraint(equalTo: cellTitleLabel.topAnchor,constant: -15),
            
            cellTitleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor,constant: 20),
            cellTitleLabel.bottomAnchor.constraint(equalTo: cellTitleLabel.topAnchor,constant: 10),
            cellTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cellFollowerLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor,constant: 5),
            cellFollowerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
