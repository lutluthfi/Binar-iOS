//
//  ARBrowseViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 04/04/22.
//

import UIKit

final class ARBrowseViewController: UIViewController {
    lazy var collectionView: UICollectionView = makeCollectionView()
    
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
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        return section
    }
    
    private func makeCollectionView() -> UICollectionView {
        let collectionLayout: UICollectionViewLayout = makeCollectionLayout()
        let view = UICollectionView(frame: screenFrame, collectionViewLayout: collectionLayout)
        view.registerCell(UICollectionViewCell.self)
        view.registerCell(ARBrowseBannerCollectionCell.self)
        view.register(<#T##viewClass: AnyClass?##AnyClass?#>, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: <#T##String#>)
        view.backgroundColor = .white
        view.dataSource = self
        return view
    }
}

extension ARBrowseViewController: UICollectionViewDataSource {
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
            return dequeueCell(ARBrowseBannerCollectionCell.self, in: collectionView, at: indexPath) { cell in
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
}
