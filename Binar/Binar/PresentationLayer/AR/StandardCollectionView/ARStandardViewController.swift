//
//  ARStandardViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 30/03/22.
//

import UIKit

final class ARStandardViewController: UICollectionController {
    private let spacing: CGFloat = 8
    private var numberOfItemInRow: CGFloat = 3
    
    private let screenRect: CGRect = UIScreen.main.bounds
    
    override func loadView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(
            frame: screenRect,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.registerCell(ARStandardCollectionViewCell.self)
        collectionView.backgroundColor = .white
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let redoButton = UIBarButtonItem(
            barButtonSystemItem: .redo,
            target: self,
            action: #selector(onRedoButtonTap)
        )
        let undoButton = UIBarButtonItem(
            barButtonSystemItem: .undo,
            target: self,
            action: #selector(onUndoButtonTap)
        )
        navigationItem.rightBarButtonItems = [redoButton, undoButton]
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
        let reusableCell: UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ARStandardCollectionViewCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? ARStandardCollectionViewCell else {
            return reusableCell
        }
        
        let number: Int = indexPath.row + 1
        cell.fill(with: number)
        
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
    
    @objc private func onRedoButtonTap(_ sender: UIBarButtonItem) {
        guard numberOfItemInRow < 10 else { return }
        numberOfItemInRow += 1
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc private func onUndoButtonTap(_ sender: UIBarButtonItem) {
        guard numberOfItemInRow > 1 else { return }
        numberOfItemInRow -= 1
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

final class ARStandardCollectionViewCell: UICollectionViewCell {
    lazy var textLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        textLabel.makeConstraint(
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        )
        contentView.backgroundColor = .black
    }
    
    func fill(with number: Int) {
        textLabel.text = String(number)
    }
}
