//
//  RDSpotifyCell.swift
//  Binar
//
//  Created by Raden Dimas on 12/04/22.
//

import UIKit


final class RDSpotifyCell: UICollectionViewCell {
    
    let cellId : String = "subCellID"
    
    let spotifyTitleLabel: UILabel = {
        let titleLabel  = UILabel()
        titleLabel.text = "Section Title"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let spotifyCollectionView : UICollectionView = {
        let collectionViewFlow = UICollectionViewFlowLayout()
        collectionViewFlow.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(spotifyTitleLabel)
        contentView.backgroundColor = .black
        spotifyCollectionView.register(RDSubSpotifyCell.self, forCellWithReuseIdentifier: cellId)
        spotifyCollectionView.backgroundColor = .black
        NSLayoutConstraint.activate([
            spotifyTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            spotifyTitleLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 8),
        ])
        setupSubCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate  func setupSubCells(){
        addSubview(spotifyCollectionView)
        
        spotifyCollectionView.dataSource = self
        spotifyCollectionView.delegate = self
        
        spotifyCollectionView.topAnchor.constraint(equalTo: spotifyTitleLabel.bottomAnchor).isActive = true
        spotifyCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        spotifyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        spotifyCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}


extension RDSpotifyCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RDSubSpotifyCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.height
        let height = frame.height
        return CGSize(width: width, height: height)
    }
    
}
