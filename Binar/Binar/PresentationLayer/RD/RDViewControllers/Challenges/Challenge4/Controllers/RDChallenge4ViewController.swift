//
//  RDChallenge3ViewController.swift
//  Binar
//
//  Created by Raden Dimas on 12/04/22.
//

import UIKit

final class RDChallenge4ViewController: UICollectionViewController {
    let cellId : String = "cellId"
    let apperance = UINavigationBarAppearance()
    private var spotifyData: [RDSpotifyModel] = RDSpotifyModel.dummySpotifyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Spotify Clone"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.backgroundColor = .black
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .black
        collectionView.register(RDSpotifyCell.self, forCellWithReuseIdentifier: cellId)
    }
}


extension RDChallenge4ViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotifyData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RDSpotifyCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = CGFloat(300)
        return CGSize(width: width, height: height)
    }
    
}
