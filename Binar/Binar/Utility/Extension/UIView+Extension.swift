//
//  UIView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 25/03/22.
//

import UIKit

@resultBuilder
struct ConstraintBuilder {
    static func buildBlock(_ components: NSLayoutConstraint...) -> [NSLayoutConstraint] {
        components
    }
}

extension UIView {
    func makeConstraint(@ConstraintBuilder builder: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        let _constraints: [NSLayoutConstraint] = builder(self)
        NSLayoutConstraint.activate(_constraints)
    }
    
    func remakeConstraint(@ConstraintBuilder builder: (UIView) -> [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = false }
        makeConstraint(builder: builder)
    }
    
    @available(*, deprecated, message: "Please use makeConstraint(@ConstraintBuilder builder: (UIView) -> [NSLayoutConstraint])")
    func makeConstraint(completion: @escaping (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        let _constraints: [NSLayoutConstraint] = completion(self)
        NSLayoutConstraint.activate(_constraints)
    }
    
    @available(*, deprecated, message: "Please use remakeConstraint(@ConstraintBuilder builder: (UIView) -> [NSLayoutConstraint])")
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
