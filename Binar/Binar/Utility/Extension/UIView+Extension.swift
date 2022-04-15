//
//  UIView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 25/03/22.
//

import UIKit

extension UIView {
    func makeConstraint(completion: @escaping (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        let _constraints: [NSLayoutConstraint] = completion(self)
        NSLayoutConstraint.activate(_constraints)
    }
    
    func remakeConstraint(completion: @escaping (UIView) -> [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = false }
        makeConstraint(completion: completion)
    }
    
    func rounded(
        cornerRadius: CGFloat,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .clear
    ) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

extension UIView {
    final func dequeueCell<CellType>(
        _ cellType: CellType.Type,
        reuseId: String? = nil,
        in collectionView: UICollectionView,
        at indexPath: IndexPath,
        completion: @escaping (CellType) -> Void
    ) -> UICollectionViewCell where CellType: UICollectionViewCell {
        let reuseIdentifier: String = reuseId ?? "\(cellType)"
        let reusableCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        if let cell = reusableCell as? CellType {
            completion(cell)
        }
        
        return reusableCell
    }
}
