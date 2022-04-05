//
//  UICollectionView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 30/03/22.
//

import UIKit

extension UICollectionView {
    func registerNibCell<Cell>(_ cellType: Cell.Type) where Cell: UICollectionViewCell {
        let reusableId: String = "\(cellType)"
        let nib = UINib(nibName: reusableId, bundle: nil)
        register(nib, forCellWithReuseIdentifier: reusableId)
    }
    
    func registerCell<Cell>(_ cellType: Cell.Type) where Cell: UICollectionViewCell {
        let reusableId: String = "\(cellType)"
        register(cellType, forCellWithReuseIdentifier: reusableId)
    }
    
    func registerView<View>(_ viewType: View.Type, ofKind kind: String) where View: UICollectionReusableView {
        let reusableId: String = "\(viewType)"
        register(viewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusableId)
    }
}
