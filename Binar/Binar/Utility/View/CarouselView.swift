//
//  CarouselView.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 06/04/22.
//

import UIKit

enum CarouselScrollingType {
    case continues
    case pagination
}

final class CarouselView<ItemView, ItemModel>: UIView, UICollectionViewContract where ItemView: UIView {
    typealias Page = Int
    typealias BuilderCell = (ItemView, ItemModel, IndexPath) -> Void
    typealias DidPageScroll = (ItemView, ItemModel, Page) -> Void
    
    lazy var collectionView: UICollectionView = makeCollectionView()
    
    private var items: [ItemModel] = []
    private var builderCell: BuilderCell?
    private var currentItemPosition: Int = 0
    
    private (set) var currentPage: Int = 1
    var didPageScroll: DidPageScroll?
    var scrollingType: CarouselScrollingType = .continues {
        didSet { didSetScrollingType() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]}
    }
    
    func configure(items: [ItemModel], itemSize: CGSize, _ builderCell: @escaping BuilderCell) {
        self.items = items
        self.builderCell = builderCell
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = itemSize
        layout?.prepare()

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
        let item: ItemModel = items[position]
        return dequeueCell(CarouselCell<ItemView>.self, in: collectionView, at: indexPath) { [weak self] (cell) in
            guard let _self = self else { return }
            _self.builderCell?(cell.component, item, indexPath)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        handlePageScrollClosure(scrollView: scrollView)
    }
    
    private func handlePageScrollClosure(scrollView: UIScrollView) {
        guard scrollingType == .pagination else { return }
        let xOffset = scrollView.contentOffset.x
        let width = scrollView.bounds.size.width
        let itemPosition = Int(ceil(xOffset / width))
        
        guard itemPosition != currentItemPosition else { return }
        
        let indexPath = IndexPath(item: itemPosition, section: 0)
        
        let currentCell = collectionView.cellForItem(at: indexPath) as? CarouselCell<ItemView>
        let itemView: ItemView? = currentCell?.component
        
        guard let _itemView = itemView else { return }
        
        let currentItem: ItemModel = items[itemPosition]
        currentPage = itemPosition + 1
        didPageScroll?(_itemView, currentItem, currentPage)
        
        currentItemPosition = itemPosition
    }
    
    private func didSetScrollingType() {
        let isPaging = scrollingType == .pagination
        collectionView.isPagingEnabled = isPaging
    }
    
    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero
        let view = UICollectionView(layout: layout)
        view.dataSource = self
        view.delegate = self
        view.showsHorizontalScrollIndicator = false
        view.registerCell(CarouselCell<ItemView>.self)
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
        component.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            $0.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]}
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
