//
//  ARInstagramViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 13/04/22.
//

import UIKit

final class ARInstagramViewController: UITableViewController {
    private lazy var loadingIndicator = UIActivityIndicatorView()
    
    private let instagramAPI = InstagramAPI(appId: "6257aed4bbcd232e233bfdcb")
    private var displayedUsers: [IGUserShortResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingIndicator)
        loadingIndicator.makeConstraint {[
            $0.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            $0.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ]}
        loadingIndicator.hidesWhenStopped = true
        
        tableView.registerCell(UITableViewCell.self)
        
        loadUsers()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfUsers: Int = displayedUsers.count
        return numberOfUsers
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dequeueCell(UITableViewCell.self, in: tableView, at: indexPath) { cell in
            let row: Int = indexPath.row
            let user: IGUserShortResponse = self.displayedUsers[row]
            cell.textLabel?.text = "\(user.firstName) \(user.lastName)"
        }
    }
    
    private func loadUsers() {
        loadingIndicator.startAnimating()
        instagramAPI.getUsers { [weak self] (result) in
            guard let _self = self else { return }
            _self.loadingIndicator.stopAnimating()
            switch result {
            case let .success(data):
                _self.displayedUsers = data.data
                _self.tableView.reloadData()
            case let .failure(error):
                print(String(describing: error))
            }
        }
    }
}
