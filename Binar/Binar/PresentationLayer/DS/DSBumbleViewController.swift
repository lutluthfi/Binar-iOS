//
//  DSBumbleViewController.swift
//  Binar
//
//  Created by Daffashiddiq on 05/04/22.
//

import UIKit

class DSBumbleViewController: UIViewController {
    
    var mainView = UIImageView()
    
    var backView = UIView()
    
    var nameView = UILabel()
    
    var imageGradient: CAGradientLayer?
    
    var collectionView: UICollectionView?
    
    private let spacing: CGFloat = 8
    
    private let screenRect: CGRect = UIScreen.main.bounds

    
    private lazy var words: [String] = {
        let paragraph = "Gym KPop KDrama Ambitious Anime"
        let res: [String] = paragraph
            .filter { $0 != "." }
            .split(separator: " ")
            .map { String($0) }
        return res
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setBackViewLayout()
        setMainViewLayout()
        setNameViewLayout()
        setChipView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        imageGradient?.frame = mainView.bounds
    }
    
    func setChipView() {
        let collectionViewLayout = DSLeftAlignmentCollectionLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView = UICollectionView(
            frame: screenRect,
            collectionViewLayout: collectionViewLayout
        )
        collectionView?.registerCell(DSChipsCollectionViewCell.self)
        collectionView?.allowsMultipleSelection = true
        collectionView?.backgroundColor = .white
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView!)
        
        collectionView?.makeConstraint{
            [$0.topAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: 10),
             $0.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor),
             $0.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
            ]
        }
    }
    
    func setRightNavBarItem() {
        let button1 = UIBarButtonItem(image: UIImage(named: "imagename"), style: .plain, target: self, action: Selector(("someFunc"))) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    func someFunc() {
        
    }
    
    func setBackViewLayout() {
        backView = UIView()
        view.addSubview(backView)
        backView.backgroundColor = .yellow
        
        backView.rounded(cornerRadius: 20)
        backView.center = view.center
        
        backView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
             $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
             $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
             $0.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ]
        }
    }
    
    
    func setMainViewLayout() {
        mainView.loadImage(resource: "https://robohash.org/etvelitvoluptatum.png?size=700x700&set=set1")
        view.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.rounded(cornerRadius: 20)
        mainView.contentMode = UIView.ContentMode.scaleAspectFit
        mainView.frame.size.height = 100
        mainView.center = view.center
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        let gradient = CAGradientLayer()
        imageGradient = gradient


        gradient.frame = mainView.bounds
        gradient.colors = [UIColor.clear, UIColor.black.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.setNeedsLayout()

        mainView.layer.insertSublayer(gradient, at: 0)
                
    }
    
    func setNameViewLayout() {
        mainView.addSubview(nameView)
        
        nameView.text = "Daffa"
        nameView.textColor = .white
        nameView.translatesAutoresizingMaskIntoConstraints = false
//        nameView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        nameView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -30).isActive = true
        nameView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        nameView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        
    }

}

final class DSLeftAlignmentCollectionLayout: UICollectionViewFlowLayout {
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

extension DSBumbleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfWords: Int = words.count
        return numberOfWords
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reusableCell: UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "DSChipsCollectionViewCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? DSChipsCollectionViewCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let word: String = words[row]
        cell.fill(with: word)
        
        return cell
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

}

class DSChipsCollectionViewCell: UICollectionViewCell {
    lazy var textLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemOrange
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
        textLabel.makeConstraint { view in
            [view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
             view.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
             view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4)]
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let cornerRad: CGFloat = frame.height / 2
        contentView.layer.cornerRadius = cornerRad
        contentView.layer.borderColor = UIColor.systemOrange.cgColor
        contentView.layer.borderWidth = 2
    }
    
    private func didSelect() {
        if isSelected {
            contentView.backgroundColor = .systemOrange
            textLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            textLabel.textColor = .systemOrange
        }
    }
    
    func fill(with string: String) {
        textLabel.text = string
    }
}

