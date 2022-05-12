//
//  LiteTableViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

class LiteTableViewController: UIViewController, LoadTableCellContract {
    private lazy var tableView = LiteTableView()
    
    var tableBackgroundColor: UIColor? {
        get { tableView.backgroundColor }
        set(newValue) { tableView.backgroundColor = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            $0.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        })
    }
    
    final func clearCells() {
        tableView.clearCells()
    }
    
    final func loadTableView(@LiteTableCellBuilder builder: () -> [LiteTableCell]) {
        tableView.load(builder: builder)
    }
    
    final func reloadTableView() {
        tableView.reloadData()
    }
    
    final func reloadCell(at indexPath: IndexPath) {
        UIView.animate(withDuration: 0.05) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
}
