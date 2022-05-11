//
//  IGProfileViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGProfileViewController: LiteTableViewController {
    @UserDefaultsArray<String>(key: "bookmark-feed-id") private var storageBookmarkFeedIds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderTableView()
    }
    
    private func renderTableView() {
        loadTableView {
            loadCell { (cell: TableCell<UIButton>, _) in
                cell.padding = UIEdgeInsets(all: 4)
                cell.content.setTitle("Reload", for: .normal)
                cell.content.backgroundColor = .systemBlue
                cell.content.addTarget(self, action: #selector(self.onReloadTap), for: .touchUpInside)
            }
            forEachElement(in: storageBookmarkFeedIds) { row, element in
                loadCell { (cell: TableCell<UILabel>, _) in
                    cell.padding = UIEdgeInsets(all: 4)
                    cell.content.text = element
                }
                rectangle(height: 1, color: .gray)
            }
        }
    }
    
    @objc private func onReloadTap() {
        clearCells()
        renderTableView()
    }
}
