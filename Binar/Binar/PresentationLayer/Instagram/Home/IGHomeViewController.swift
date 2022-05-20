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
    
    private let viewModel = IGHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupView()
        setupNavBar()
        viewModel.viewDidLoad()
    }
    
    private func setupNavBar() {
        let plusBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: #selector(onPlusBarButtonTap))
        navigationItem.rightBarButtonItem = plusBarButton
    }
    
    private func setupView() {
        tableBackgroundColor = .secondarySystemBackground
    }
    
    private func setupViewModel() {
        viewModel.onRouterChanged = { [weak self] (router) in
            switch router {
            case .openHomeCreateFeed:
                let viewController = IGHomeCreateFeedViewController()
                let navigationController = UINavigationController(rootViewController: viewController)
                self?.present(navigationController, animated: true)
            }
        }
        viewModel.onLoadFeedsSuccess = { [weak self] (feeds) in
            self?.renderTableView(with: feeds)
        }
        viewModel.onLoadFeedsFailure = {
            print("OnLoadFeedsFailure")
        }
    }
    
    private func renderTableView(with feeds: [IGHomeFeedViewParam]) {
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
    
    private func feedGroupCell(populateWith feeds: [IGHomeFeedViewParam]) -> [LiteTableCell] {
        forEachElement(in: feeds) { row, element in
            loadGroupCell { (groupCell: IGHomeFeedGroupCell) in
                let isBookmarked: Bool = self.viewModel.isFeedBookmarked(element)
                groupCell.configure(feed: element, isBookmarked: isBookmarked)
                groupCell.onBookmarkTap = { [weak self] _ in
                    self?.viewModel.onBookmarkTap(feed: element)
                }
                groupCell.onLikesTap = { isLiked in
                    print(isLiked)
                }
                groupCell.onCaptionTap = { [weak self] _ in
                    self?.updateTableView()
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
    
    @objc private func onPlusBarButtonTap() {
        viewModel.onPlusBarButtonTap()
    }
}
