//
//  IGHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import FirebaseRemoteConfig
import UIKit

final class IGHomeViewController: LiteTableViewController {
    lazy var creatorView = IGFeedCreatorView()
    
    private let presenter = IGHomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.onLoadFeedsSuccess = { [weak self] (feeds) in
            self?.render(feeds: feeds)
        }
        presenter.onLoadFeedsFailure = {
            print("OnLoadFeedsFailure")
        }
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        tableBackgroundColor = .secondarySystemBackground
    }
    
    private func render(feeds: [IGFeedViewParam]) {
        loadTableView {
            adBannerCell()
            feedGroupCell(populateWith: feeds)
            endOfContentCell()
        }
    }
    
    private func adBannerCell() -> LiteTableCell {
        let adBanner: AdBannerRCEntity? = RemoteConfigHelper.standard.adBanner
        guard let _adBanner = adBanner else { return emptyCell() }
        return loadCell { (cell: TableCell<UILabel>, _) in
            cell.padding = UIEdgeInsets(all: 12)
            cell.backgroundColor = UIColor(hex: _adBanner.backgroundColor)
            cell.content.textAlignment = .center
            cell.content.text = _adBanner.text
        }
    }
    
    private func feedGroupCell(populateWith feeds: [IGFeedViewParam]) -> [LiteTableCell] {
        forEachElement(in: feeds) { row, element in
            loadGroupCell { (groupCell: IGFeedGroupCell) in
//                let isBookmarked: Bool = self.bookmarkFeedIds.contains(element.id)
                groupCell.configure(feed: element, isBookmarked: false)
                groupCell.onBookmarkTap = { feedId in
//                    self.addNewBookmark(feedId: feedId)
                }
                groupCell.onLikesTap = { isLiked in
                    print(isLiked)
                }
                groupCell.onCaptionTap = { [weak self] (indexPath) in
                    self?.reloadCell(at: indexPath)
                }
            }
        }
    }
    
    private func endOfContentCell() -> LiteTableCell {
        loadCell { (cell: TableCell<UILabel>, _) in
            cell.padding = UIEdgeInsets(all: 12)
            cell.backgroundColor = .secondarySystemBackground
            cell.content.textAlignment = .center
            cell.content.text = "End of Content 🎉"
        }
    }
    
//    private func addNewBookmark(feedId: String) {
//        let isExist: Bool = bookmarkFeedIds.contains(feedId)
//        if isExist {
//            bookmarkFeedIds.removeAll(where: { $0 == feedId })
//        } else {
//            bookmarkFeedIds.append(feedId)
//        }
//    }
}
