//
//  IGHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGHomeViewController: LiteTableViewController {
    lazy var creatorView = IGFeedCreatorView()
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instagramAPI.getFeeds { [weak self] result in
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
            loadGroupCell { (groupCell: TryGroupCell) in
                groupCell.configure()
            }
            forEachElement(in: feeds) { row, element in
                loadCell { (cell: TableCell<IGFeedCreatorView>, _) in
                    cell.padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                    let username = [element.owner.firstName, element.owner.lastName].joined(separator: ".")
                    let avatarUrlString = element.owner.picture
                    cell.content.configure(username: username, avatarUrlString: avatarUrlString)
                }
                loadCell { (cell: TableCell<UIView>, _) in
                    cell.setHeight(16)
                    cell.content.backgroundColor = .secondarySystemBackground
                }
            }
        }
    }
}

final class TryGroupCell: LiteTableGroupCell {
    func configure() {
    }
    
    override func populateCells() -> [LiteTableCell] {
        setCells {
            loadCell { (cell: TableCell<UIView>, _) in
                cell.setHeight(12)
                cell.backgroundColor = .systemBlue
            }
            loadCell { (cell: TableCell<UILabel>, _) in
                cell.content.text = "Ini dari Group Cell"
            }
            loadCell { (cell: TableCell<UIView>, _) in
                cell.setHeight(12)
                cell.backgroundColor = .systemBlue
            }
        }
    }
}
