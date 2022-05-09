//
//  BINewsViewController.swift
//  programmatically
//
//  Created by Bagas on 08/04/22.
//

import UIKit

final class BINewsViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = makeCollectionView()
    private weak var topBannerSectionPagedView: BITopBannerSectionPagedView?
    
    private let screenFrame: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
    }
    
    private func setupAddSubview() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraint() {
        collectionView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
             $0.topAnchor.constraint(equalTo: self.view.topAnchor),
             $0.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        }
    }
    
    private func makeCollectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _) -> NSCollectionLayoutSection in
            switch sectionIndex {
            case 0:
                return self.makeTopBannerSection()
            case 1:
                return self.makeFavoriteSection()
            default:
                return self.makeDefaultSection()
            }
        }
        return layout
    }
    
    private func makeDefaultSection() -> NSCollectionLayoutSection {
        let item: NSCollectionLayoutItem = {
            let layoutItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            return layoutItem
        }()
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.3),
                heightDimension: .absolute(200)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        return section
    }
    
    private func makeTopBannerSection() -> NSCollectionLayoutSection {
        let item: NSCollectionLayoutItem = {
            let layoutItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            return layoutItem
        }()
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.5)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
        
        return section
    }
    
    private func makeFavoriteSection() -> NSCollectionLayoutSection {
        let item: NSCollectionLayoutItem = {
            let layoutItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            )
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            return layoutItem
        }()
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.3),
                heightDimension: .absolute(200)
            ),
            subitems: [item]
        )
        
        let footerSectionSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let footerSectionItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSectionSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [footerSectionItem]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        return section
    }
    
    private func makeCollectionView() -> UICollectionView {
        let collectionLayout: UICollectionViewLayout = makeCollectionLayout()
        let view = UICollectionView(frame: screenFrame, collectionViewLayout: collectionLayout)
        view.registerCell(UICollectionViewCell.self)
        view.registerCell(BINewsBannerCollectionCell.self)
        view.registerView(
            BITopBannerSectionPagedView.self,
            ofKind: UICollectionView.elementKindSectionFooter
        )
        view.backgroundColor = .white
        view.delegate = self
        view.dataSource = self
        return view
    }
}

extension BINewsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let section: Int = indexPath.section
        switch section {
        case 0:
            return dequeueCell(BINewsBannerCollectionCell.self, in: collectionView, at: indexPath) { cell in
                cell.fill(with: "https://global-uploads.webflow.com/6100d0111a4ed76bc1b9fd54/617b2e0d60041b7f14d37df5_WebDev%20Banner%403x.png")
            }
        case 1:
            return dequeueCell(UICollectionViewCell.self, in: collectionView, at: indexPath) { cell in
                cell.rounded(cornerRadius: 8, borderWidth: 1, borderColor: .systemGreen)
            }
        default:
            return dequeueCell(UICollectionViewCell.self, in: collectionView, at: indexPath) { cell in
                let item: Int = indexPath.item
                if item % 2 == 0 {
                    cell.contentView.backgroundColor = .systemGray
                } else {
                    cell.contentView.backgroundColor = .systemBlue
                }
            }
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let section: Int = indexPath.section
        switch section {
        case 1:
            let reusableView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: "BITopBannerSectionPagedView",
                for: indexPath
            )
            
            if topBannerSectionPagedView == nil, let view = reusableView as? BITopBannerSectionPagedView {
                topBannerSectionPagedView = view
                view.numberOfItem = 100
            }
            
            return reusableView
        default:
            fatalError("Cannot dequeueReusableSupplementaryView")
        }
    }
}

extension BINewsViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplaying cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        if topBannerSectionPagedView?.currentPage == indexPath.row {
            guard let visible = collectionView.visibleCells.first,
                  let index = collectionView.indexPath(for: visible)?.row else { return }
            topBannerSectionPagedView?.currentPage = index
        }
    }
}

final class BITopBannerSectionPagedView: UICollectionReusableView {
    lazy var textLabel = UILabel()
    
    var currentPage: Int = 0 {
        didSet {
            textLabel.text = "\(currentPage)/\(numberOfItem)"
        }
    }
    var numberOfItem: Int = 0
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        addSubview(textLabel)
        textLabel.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             $0.topAnchor.constraint(equalTo: self.topAnchor),
             $0.rightAnchor.constraint(equalTo: self.rightAnchor),
             $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
        }
        
        currentPage = 0
    }
}

