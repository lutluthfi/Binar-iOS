//
//  ARLiteViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 17/06/22.
//

import UIKit

final class ARLiteViewController: LiteTableViewController {
    private(set) lazy var gradientBackground = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableBackgroundColor = .clear
        setupGradientBackground()
        loadTableView {
            searchBar()
            categoryTitle()
            categoryCarousel()
        }
    }
    
    func setupGradientBackground() {
        view.addSubview(gradientBackground)
        view.sendSubviewToBack(gradientBackground)
        gradientBackground.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            $0.heightAnchor.constraint(equalToConstant: 400)
        })
        gradientBackground.backgroundColor = .systemGreen
    }
    
    private func searchBar() -> LiteTableCell {
        loadCell { (cell: TableCell<UIView>, _) in
            cell.setHeight(48)
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 32, right: 16)
            cell.content.backgroundColor = .gray
            cell.backgroundColor = .clear
        }
    }
    
    private func categoryTitle() -> LiteTableCell {
        loadCell { (cell: TableCell<UILabel>, _) in
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            cell.content.text = "Telusuri Kategori"
            cell.backgroundColor = .clear
        }
    }
    
    private func categoryCarousel() -> LiteTableCell {
        loadCell { (cell: TableCell<CarouselView<UILabel, String>>, _) in
            let itemSize = CGSize(width: 110, height: 44)
            cell.setHeight(44)
            cell.backgroundColor = .clear
            cell.content.backgroundColor = .clear
            cell.content.collectionView.backgroundColor = .clear
            let sectionInset = UIEdgeInsets(vertical: 0, horizontal: 16)
            cell.content.configure(sectionInset: sectionInset, items: ["Semua", "Hobi", "Kendaraan", "Semua", "Hobi", "Kendaraan"], itemSize: itemSize) { view, item, indexPath in
                view.text = item
                view.textAlignment = .center
                view.backgroundColor = .purple
                view.rounded(cornerRadius: 12)
            }
        }
    }
}
