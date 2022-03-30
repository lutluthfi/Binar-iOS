//
//  ARViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/03/22.
//

import UIKit

final class ARViewController: UITableViewController, StoryboardInstantiable {
    enum Course: String, CaseIterable, TitleEnum {
        case ScrollView
        case StandardCollectionView
        case CompositionalCollectionView
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
        let numberOfCourse: Int = Course.allCases.count
        return numberOfCourse
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let row: Int = indexPath.row
        let titleCourse: String = Course.allCases[row].rawTitle
        cell.textLabel?.text = titleCourse
        
        return cell
    }
    
    // MARK: TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let course: Course = Course.allCases[row]
        switch course {
        case .ScrollView:
            break
        case .StandardCollectionView:
            let viewController = ARStandardViewController()
            open(viewController)
        case .CompositionalCollectionView:
            break
        }
    }
    
    private func open(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
