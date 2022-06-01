//
//  MFFasilChallenge4VC.swift
//  Binar
//
//  Created by Maulana Frasha on 20/05/22.
//

import UIKit
import SQLite3

final class MFFasilChallenge4VC: UITableViewController {
    
    private let instagramAPI = InstagramAPI(appId: "62553804d7e95815d857090f")
    private var userShortResponse: [IGUserShortResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(MFAnimalTableCellChallenge4.self)
        tableView.allowsSelection = false
        
        instagramAPI.getUsers { [weak self] (result) in
            guard let _self = self else { return }
            switch result {
            case let .success(data):
                _self.userShortResponse = data.data
                _self.tableView.reloadData()
            case let .failure(error):
                print(String(describing: error))
            }
        }
//        print(userShortResponse)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numbersOfUsers: Int = userShortResponse.count
        return numbersOfUsers
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "MFAnimalTableCellChallenge4",
            for: indexPath
        ) as! MFAnimalTableCellChallenge4
        
    
        
        return reusableCell
    }
    
}
