//
//  LiteTableViewAdapter.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

final class LiteTableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var cells: [LiteTableCell] = []
    private var cellHeights: [IndexPath: CGFloat] = [:]
    
    func clearCells() {
        cells.removeAll()
    }
    
    func setCells(_ cells: [LiteTableCell]) {
        self.cells = cells
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let liteCell: LiteTableCell = cells[safe: indexPath.row] else { return 0 }
        let isHidden: Bool = liteCell.isHidden
        
        if isHidden {
            return 0
        } else if let cellHeight: CGFloat = cellHeights[indexPath] {
            return cellHeight
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let liteCell: LiteTableCell = cells[safe: indexPath.row] else { return 0 }
        let isHidden: Bool = liteCell.isHidden
        
        if isHidden {
            return 0
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfCell: Int = cells.count
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let liteCell: LiteTableCell = cells[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: liteCell.identifier,
            for: indexPath
        )
        
        liteCell.dequeue(reusableCell, indexPath)
        
        return reusableCell
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        cellHeights[indexPath] = cell.frame.height
    }
}
