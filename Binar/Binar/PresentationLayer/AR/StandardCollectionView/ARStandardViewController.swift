//
//  ARStandardViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 30/03/22.
//

import UIKit

final class ARStandardViewController: UICollectionController {
    private let spacing: CGFloat = 8
    private let numberOfItemInRow: CGFloat = 3
    
    private let screenRect: CGRect = UIScreen.main.bounds
    
    override func loadView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(
            frame: screenRect,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.registerCell(UICollectionViewCell.self)
        collectionView.backgroundColor = .white
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "UICollectionViewCell",
            for: indexPath
        )
        
        let row: Int = indexPath.row
        let isEven = row % 2 == 0
        if isEven {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .blue
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        var length: CGFloat = 0
        
        let screenWidth: CGFloat = screenRect.width
        length = (screenWidth - ((numberOfItemInRow + 1) * spacing)) / numberOfItemInRow
        
        return CGSize(width: length, height: length)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return spacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return spacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
    }
}
