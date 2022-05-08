//
//  DPChapther5ViewController.swift
//  Binar
//
//  Created by Dimas Purnomo on 09/05/22.
//

import UIKit

class DPChapther5ViewController: UITableViewController {

    private lazy var loadingIndicator = UIActivityIndicatorView()
    
    private let dpAPI = DPDummyAPI(appId: "6257e4e49af5bf50b991e4f6")
    private var displayedUsers: [DPDummyUserShortResponse] = []
    
    override func viewDidLoad() {
        title = "Challenge 5 Course"
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
            let user: DPDummyUserShortResponse = self.displayedUsers[row]
            cell.textLabel?.text = "\(user.firstName) \(user.lastName)"
        }
    }
    
    private func loadUsers() {
        loadingIndicator.startAnimating()
        dpAPI.getUsers { [weak self] (result) in
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
