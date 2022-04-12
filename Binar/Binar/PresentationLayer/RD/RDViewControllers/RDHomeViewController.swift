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
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupHomeTableView()
    }
        
    private func setupHomeTableView() {
        view.addSubview(homeTableView)
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "rdHomeCell")
        
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    
}

extension RDHomeViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let challengeCount: Int = homeTableTitle.count
        
        return challengeCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "rdHomeCell",
            for: indexPath
        )
      
        let row: Int = indexPath.row
        let challenge: String = homeTableTitle[row].rawValue
        
        cell.textLabel?.text = challenge
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let challenge: RDHomeTitleModel = RDHomeTitleModel.sorted[row]
        
        switch challenge {
        case .challengeWeek3:
            open(to: RDChallenge3ViewController())
        case .challengeWeek4:
            let layout = UICollectionViewFlowLayout()
            open(to: RDChallenge4ViewController(collectionViewLayout: layout))
        case .challengeWeek5:
            open(to: RDChallenge5ViewController())
        case .challengeWeek6:
            open(to: RDChallenge6ViewController())
        }
    }
    
    private func open(to viewController: UIViewController) {
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
