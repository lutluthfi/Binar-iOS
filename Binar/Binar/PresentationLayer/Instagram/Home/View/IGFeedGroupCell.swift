//
//  IGFeedGroupCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 26/04/22.
//

import UIKit

final class IGFeedGroupCell: LiteTableGroupCell {
    private var feed: IGFeedResponse?
    
    var onLikesImageViewTap: IGFeedLikesView.OnLikesImageViewTapped?
    
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
        return loadCell { (cell: TableCell<IGFeedLikesView>, _) in
            print("test --- loadLikeCell")
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            cell.content.configure(numberOfLikes: _feed.likes)
            cell.content.onLikesImageViewTap = self.onLikesImageViewTap
        }
        .setIdentifier(_feed.id)
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

