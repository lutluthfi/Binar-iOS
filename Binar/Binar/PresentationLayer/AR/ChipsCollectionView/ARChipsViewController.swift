//
//  ARChipsViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 30/03/22.
//

import UIKit

// 1. chips oval + border ✅
// 2. ketika chips select warna jadi biru ✅
// 3. sesuaikan chips dengan content ✅
// 4. rata kiri

final class LeftAlignmentCollectionLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {
        let attributes: [UICollectionViewLayoutAttributes]? = super.layoutAttributesForElements(in: rect)
        guard let _attributes: [UICollectionViewLayoutAttributes] = attributes else {
            return []
        }
        
        var x: CGFloat = sectionInset.left
        var y: CGFloat = -1.0
        
        for attribute in _attributes {
            if attribute.representedElementCategory != .cell { continue }
            
            if attribute.frame.origin.y >= y {
                x = sectionInset.left
            }
            attribute.frame.origin.x = x
            x += attribute.frame.width + minimumInteritemSpacing
            y = attribute.frame.maxY
        }
        
        return _attributes
    }
}

final class ARChipsViewController: UICollectionController {
    private let spacing: CGFloat = 8
    private lazy var words: [String] = {
        let paragraph = "You can use UICollectionViewCell as-is or subclass it to add additional properties and methods. The layout and presentation of cells is managed by the collection view and its corresponding layout object. To configure the content and appearance of your cell, you can set its contentConfiguration and backgroundConfiguration. Alternatively, add the views needed to present the data item’s content as subviews to the view in the contentView property. Do not directly add subviews to the cell itself. The cell manages multiple layers of content, of which the content view is only one. In addition to the content view, the cell manages two background views that display the cell in its selected and unselected states. You typically don’t create instances of this class yourself. Instead, you register your specific cell subclass (or a nib file containing a configured instance of your class) using a cell registration. When you want a new instance of your cell class, call the dequeueConfiguredReusableCell(using:for:item:) method of the collection view object to retrieve one."
        let res: [String] = paragraph
            .filter { $0 != "." }
            .split(separator: " ")
            .map { String($0) }
        return res
    }()
    
    private let screenRect: CGRect = UIScreen.main.bounds
    
    override func loadView() {
        let collectionViewLayout = LeftAlignmentCollectionLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView = UICollectionView(
            frame: screenRect,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.registerCell(ARChipsCollectionViewCell.self)
        collectionView.allowsMultipleSelection = true
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
        let numberOfWords: Int = words.count
        return numberOfWords
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let reusableCell: UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ARChipsCollectionViewCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? ARChipsCollectionViewCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let word: String = words[row]
        cell.fill(with: word)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
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
    
    // MARK: UICollectionViewDelegate
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
    }
}

final class ARChipsCollectionViewCell: UICollectionViewCell {
    lazy var textLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemBlue
        view.textAlignment = .center
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            didSelect()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        textLabel.makeConstraint(
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let cornerRad: CGFloat = frame.height / 2
        contentView.layer.cornerRadius = cornerRad
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.layer.borderWidth = 2
    }
    
    private func didSelect() {
        if isSelected {
            contentView.backgroundColor = .systemBlue
            textLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            textLabel.textColor = .systemBlue
        }
    }
    
    func fill(with string: String) {
        textLabel.text = string
    }
}
