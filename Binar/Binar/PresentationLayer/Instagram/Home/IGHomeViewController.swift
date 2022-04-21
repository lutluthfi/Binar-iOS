//
//  IGHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGHomeViewController: UITableViewController {
    lazy var creatorView = IGFeedCreatorView()
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    
    private var displayedFeed: [IGFeedResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.registerCell(TableCell<IGFeedCreatorView>.self)
        tableView.registerCell(TableCell<UILabel>.self)
        tableView.backgroundColor = UIColor.secondarySystemBackground
        
        instagramAPI.getFeeds { [weak self] result in
            switch result {
            case let .success(data):
                self?.displayedFeed = data.data
                self?.tableView.reloadData()
            case .failure:
                break
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfFeed: Int = displayedFeed.count
        return numberOfFeed
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: Int = indexPath.row
        let feed: IGFeedResponse = displayedFeed[row]
        return dequeueCell(TableCell<IGFeedCreatorView>.self, in: tableView, at: indexPath) { cell in
            let username: String = feed.owner.firstName
            let avatarUrlString: String = feed.owner.picture
            cell.padding = UIEdgeInsets(top: 12, left: 20, bottom: -12, right: -20)
            cell.content.configure(username: username, avatarUrlString: avatarUrlString)
        }
    }
}
