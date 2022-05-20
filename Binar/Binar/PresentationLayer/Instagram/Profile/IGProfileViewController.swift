//
//  IGProfileViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGProfileViewController: LiteTableViewController {
    private let feedCoreDataStorage = IGFeedCoreDataStorage()
    
    @UserDefaultsArrayObject<IGFeedResponse>(key: "bookmark-feeds") private var cacheBookmarkFeeds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedCoreDataStorage.getFeeds { [weak self] r in
            switch r {
            case let .success(result):
                DispatchQueue.main.async {
                    self?.renderTableView(fillWith: result)
                }
            case .failure:
                break
            }
        }
    }
    
    private func renderTableView(fillWith responses: [IGFeedResponse]) {
        loadTableView {
            loadCell { (cell: TableCell<UIButton>, _) in
                cell.padding = UIEdgeInsets(all: 4)
                cell.content.setTitle("Reload", for: .normal)
                cell.content.backgroundColor = .systemBlue
                cell.content.addTarget(self, action: #selector(self.onReloadTap), for: .touchUpInside)
            }
            forEachElement(in: responses) { row, element in
                loadGroupCell { (groupCell: IGHomeFeedGroupCell) in
                    let viewParam: IGHomeFeedViewParam = element.toViewParam()
                    groupCell.configure(feed: viewParam, isBookmarked: true)
                }
            }
        }
    }
    
    @objc private func onReloadTap() {
        clearCells()
    }
}
