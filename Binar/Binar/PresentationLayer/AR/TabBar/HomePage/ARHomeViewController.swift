//
//  ARHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 04/04/22.
//

import UIKit

final class ARHomeViewController: UIViewController {
    lazy var tableView: UITableView = makeTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            $0.topAnchor.constraint(equalTo: self.view.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]}
    }
    
    private func makeTableView() -> UITableView {
        let view = UITableView()
        view.dataSource = self
        view.separatorStyle = .none
        view.estimatedRowHeight = 44
        view.rowHeight = UITableView.automaticDimension
        view.registerCell(UITableViewCell.self)
        view.registerCell(ARTopBannerTableCell.self)
        return view
    }
}

extension ARHomeViewController: UITableViewContract {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: Int = indexPath.row
        switch row {
        case 0:
            return dequeueCell(
                ARTopBannerTableCell.self,
                in: tableView,
                at: indexPath,
                completion: onTopBannerTableCell
            )
//        case 1:
//            return dequeueCell(UITableViewCell.self, in: tableView, at: indexPath) { cell in
//                cell.textLabel?.text = "Default Cell"
//            }
        default:
            return dequeueCell(UITableViewCell.self, in: tableView, at: indexPath) { cell in
                cell.textLabel?.text = "Default Cell"
            }
        }
    }
    
    private func onTopBannerTableCell(_ cell: ARTopBannerTableCell) {
        cell.configure()
    }
}
