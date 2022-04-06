//
//  CarouselTableCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 06/04/22.
//

import UIKit

final class CarouselTableCell<ViewCell, Item>: UITableViewCell, UICollectionViewContract where ViewCell: UIView {
    typealias BuilderCell = (ViewCell, Item, IndexPath) -> Void
    lazy var collectionView: UICollectionView = makeCollectionView()
    
    private var items: [Item] = []
    private var builderCell: BuilderCell?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
             $0.topAnchor.constraint(equalTo: self.contentView.topAnchor),
             $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)]
        }
    }
    
    func configure(items: [Item], _ builderCell: @escaping BuilderCell) {
        self.items = items
        self.builderCell = builderCell
        collectionView.reloadData()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        let numberOfItems: Int = items.count
        return numberOfItems
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let position: Int = indexPath.item
        let item: Item = items[position]
        return dequeueCell(CarouselCell<ViewCell>.self, in: collectionView, at: indexPath) { cell in
            self.builderCell?(cell.component, item, indexPath)
        }
    }
    
    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(layout: layout)
        view.dataSource = self
        view.showsHorizontalScrollIndicator = false
        view.registerCell(CarouselCell<ViewCell>.self)
        return view
    }
}

final class CarouselCell<Component>: UICollectionViewCell where Component: UIView {
    lazy var component = Component()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(component)
        component.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
             $0.topAnchor.constraint(equalTo: self.contentView.topAnchor),
             $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)]
        }
    }
    
    override func preferredLayoutAttributesFitting(
        _ layoutAttributes: UICollectionViewLayoutAttributes
    ) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size: CGSize = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame: CGRect = layoutAttributes.frame
        newFrame.size.width = ceil(size.width)
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
