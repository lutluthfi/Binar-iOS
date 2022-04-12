//
//  RDHomeViewController.swift
//  Binar
//
//  Created by Raden Dimas on 08/04/22.
//

import UIKit

final class RDHomeViewController: UIViewController {
    
    let homeTableTitle: [RDHomeTitleModel] = RDHomeTitleModel.allCases
    
    private lazy var homeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeTableView()
    }
    
    private func setupHomeTableView() {
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.register(RDHomeListCell.self, forCellReuseIdentifier: "rdHomeCell")
        
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension RDHomeViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let challengeCount: Int = homeTableTitle.count
        
        return challengeCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rdCell = tableView.dequeueReusableCell(withIdentifier: "rdHomeCell", for: indexPath)
        guard let cell = rdCell as? RDHomeListCell else {
            return rdCell
        }
        let row: Int = indexPath.row
        let challenge: RDHomeTitleModel = homeTableTitle[row]
        
        cell.fill(with: challenge)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
