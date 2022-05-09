//
//  RDSpotifyCell.swift
//  Binar
//
//  Created by Raden Dimas on 12/04/22.
//

import UIKit


final class RDSpotifyCell: UICollectionViewCell {
    
    let cellId : String = "subCellID"
    private var spotifyData: [RDSpotifyModel] = RDSpotifyModel.dummySpotifyData()
    
    var section : RDSpotifyModel? {
           didSet{
               guard let section = self.section else {return}
               self.spotifyTitleLabel.text = section.title
               self.spotifySubTitleLabel.text = section.subTitle
               self.playlist = section.playlist
           }
       }
    
    var playlist = [RDSpotifyPlaylist]()
        
    let spotifyTitleLabel: UILabel = {
        let titleLabel  = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let spotifySubTitleLabel: UILabel = {
        let titleLabel  = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
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
        contentView.addSubview(spotifySubTitleLabel)
        contentView.backgroundColor = .black
        spotifyCollectionView.register(RDSubSpotifyCell.self, forCellWithReuseIdentifier: cellId)
        spotifyCollectionView.backgroundColor = .black
        setupConstraints()
        setupSubCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            spotifyTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            spotifyTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            spotifyTitleLabel.bottomAnchor.constraint(equalTo: spotifyTitleLabel.topAnchor,constant: 25),
            spotifySubTitleLabel.topAnchor.constraint(equalTo: spotifyTitleLabel.bottomAnchor, constant: 5),
            spotifySubTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            spotifySubTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            spotifySubTitleLabel.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    
    private func setupSubCells(){
        addSubview(spotifyCollectionView)
        
        spotifyCollectionView.dataSource = self
        spotifyCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            spotifyCollectionView.topAnchor.constraint(equalTo: spotifySubTitleLabel.bottomAnchor,constant: 10),
            spotifyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            spotifyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            spotifyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


extension RDSpotifyCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotifyData[section].playlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RDSubSpotifyCell
        
        cell.playlist = playlist[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.height
        let height = frame.height
        return CGSize(width: width, height: height)
    }
    

    
}
