//
//  LiteTableViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

class LiteTableViewController: UIViewController {
    private lazy var tableView = LiteTableView()
    
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
    
    final func loadTableView(@LiteTableCellBuilder builder: () -> [LiteTableCell]) {
        tableView.load(builder: builder)
    }
    
    final func loadCell<Cell>(
        dequeue: @escaping (Cell, IndexPath) -> Void
    ) -> LiteTableCell where Cell: UITableViewCell {
        let liteCell = LiteTableCell(cellType: Cell.self) { cell, indexPath in
            guard let _cell = cell as? Cell else { return }
            dequeue(_cell, indexPath)
        }
        return liteCell
    }
    
    final func forEachElement<Element>(
        in array: [Element],
        @LiteTableCellBuilder builder: (Int, Element) -> [LiteTableCell]
    ) -> [LiteTableCell] {
        var cells: [LiteTableCell] = []
        for (row, element) in array.enumerated() {
            let liteCells: [LiteTableCell] = builder(row, element)
            cells.append(contentsOf: liteCells)
        }
        return cells
    }
    
    final func loadGroupCell<GroupCell>(
        build: (GroupCell) -> Void
    ) -> [LiteTableCell] where GroupCell: LiteTableGroupCell {
        let groupCell = GroupCell()
        let liteCells: [LiteTableCell] = groupCell.populateCells()
        return liteCells
    }
}
