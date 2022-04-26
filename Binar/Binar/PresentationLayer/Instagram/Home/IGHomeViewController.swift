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

final class IGFeedGroupCell: LiteTableGroupCell {
    private var feed: IGFeedResponse?
    
    func configure(feed: IGFeedResponse) {
        self.feed = feed
    }
    
    override func populateCells() -> [LiteTableCell] {
        setCells {
            creatorCell()
            imageCell()
            likeCell()
            captionCell()
            separatorCell()
        }
    }
    
    private func creatorCell() -> LiteTableCell {
        guard let _feed = feed else { return emptyCell() }
        return loadCell { (cell: TableCell<IGFeedCreatorView>, _) in
            cell.padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            let username = [_feed.owner.firstName, _feed.owner.lastName].joined(separator: ".")
            let avatarUrlString = _feed.owner.picture
            cell.content.configure(username: username, avatarUrlString: avatarUrlString)
        }
    }
    
    private func imageCell() -> LiteTableCell {
        guard let _feed = feed else { return emptyCell() }
        return loadCell { (cell: TableCell<UIImageView>, _) in
            let screenWidth: CGFloat = UIScreen.main.bounds.width
            cell.setHeight(screenWidth)
            cell.padding = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
            cell.content.contentMode = .scaleAspectFill
            cell.content.clipsToBounds = true
            cell.content.loadImage(resource: _feed.image)
        }
    }
    
    private func likeCell() -> LiteTableCell {
        guard let _feed = feed else { return emptyCell() }
        return loadCell { (cell: TableCell<IGLikesLabel>, _) in
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            cell.content.configure(_feed.likes)
        }
    }
    
    private func captionCell() -> LiteTableCell {
        guard let _feed = feed else { return emptyCell() }
        return loadCell { (cell: TableCell<IGCaptionLabel>, _) in
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            cell.content.configure(username: _feed.owner.firstName, caption: _feed.text)
        }
    }
    
    private func separatorCell() -> LiteTableCell {
        rectangle(height: 16, color: .secondarySystemBackground, identifier: "SeparatorCell")
    }
}
