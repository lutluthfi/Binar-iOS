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
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableBackgroundColor = .secondarySystemBackground
        instagramAPI.getFeeds { [weak self] (result) in
            switch result {
            case let .success(data):
                self?.render(feeds: data.data)
            case .failure:
                break
            }
        }
    }
    
    private func render(feeds: [IGFeedResponse]) {
        loadTableView {
            adBannerCell()
            forEachElement(in: feeds) { row, element in
                loadGroupCell { (groupCell: IGFeedGroupCell) in
                    groupCell.configure(feed: element)
                    groupCell.onLikesImageViewTap = { isLiked in
                        print(isLiked)
                    }
                }
            }
            loadCell { (cell: TableCell<UILabel>, _) in
                cell.padding = UIEdgeInsets(all: 12)
                cell.backgroundColor = .secondarySystemBackground
                cell.content.textAlignment = .center
                cell.content.text = "End of Content 🎉"
            }
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
}
