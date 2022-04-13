//
//  DSMainTableViewController.swift
//  Binar
//
//  Created by Daffashiddiq on 04/04/22.
//

import UIKit

final class DSMainTableViewController: UITableViewController, StoryboardInstantiable {
    enum Course: String, CaseIterable, TitleEnum {
        case BumbleChallenge
        case Challenge1
        
        static var sorted: [Course] {
            Course.allCases.sorted {
                $0.rawTitle < $1.rawTitle
            }.map { $0 }
        }
    }
    
    private let name: String
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(UITableViewCell.self)
    }
    
    // MARK: TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfCourse: Int = Course.sorted.count
        return numberOfCourse
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "UITableViewCell",
            for: indexPath
        )
        
        let row: Int = indexPath.row
        let titleCourse: String = Course.sorted[row].rawTitle
        cell.textLabel?.text = titleCourse
        
        return cell
    }
    
    // MARK: TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let course: Course = Course.sorted[row]
        switch course {
        case .BumbleChallenge:
            open(DSBumbleViewController())
        case .Challenge1:
            open(IGLikesLabelViewController())
        }
    }
    
    private func open(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
