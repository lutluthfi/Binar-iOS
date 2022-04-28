//
//  IGFeedGroupCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 26/04/22.
//

import UIKit

final class IGFeedGroupCell: LiteTableGroupCell {
    typealias OnBookmarkTap = (String) -> Void
    typealias OnLikesTap = (Bool) -> Void
    typealias OnCaptionTap = (IndexPath) -> Void
    
    private var feed: IGFeedViewParam?
    private var isBookmarked = false
    
    var onBookmarkTap: OnBookmarkTap?
    var onLikesTap: OnLikesTap?
    var onCaptionTap: OnCaptionTap?
    
    func configure(feed: IGFeedViewParam, isBookmarked: Bool) {
        self.feed = feed
        self.isBookmarked = isBookmarked
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
            cell.content.configure(username: _feed.username, avatarUrlString: _feed.avatarUrlString)
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
            cell.content.loadImage(resource: _feed.pictureUrlString)
        }
    }
    
    private func likeCell() -> LiteTableCell {
        guard let _feed = feed else { return emptyCell() }
        return loadCell { (cell: TableCell<IGFeedLikesView>, _) in
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            cell.content.configure(numberOfLikes: _feed.numberOfLikes, isBookmarked: self.isBookmarked)
            cell.content.onBookmarkTap = { [weak self] _ in
                self?.onBookmarkTap?(_feed.id)
            }
            cell.content.onLikesTap = self.onLikesTap
        }
        .setIdentifier("FeedLikesViewCell-\(_feed.id)")
    }
    
    private func captionCell() -> LiteTableCell {
        guard let _feed = feed else { return emptyCell() }
        return loadCell { (cell: TableCell<IGCaptionLabel>, indexPath: IndexPath) in
            cell.padding = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            cell.content.configure(username: _feed.username, caption: _feed.caption)
            cell.content.onTap = { [weak self] in
                self?.onCaptionTap?(indexPath)
            }
        }
        .setIdentifier("CaptionLabelCell-\(_feed.id)")
    }
    
    private func separatorCell() -> LiteTableCell {
        rectangle(height: 16, color: .secondarySystemBackground, identifier: "SeparatorCell")
    }
}

