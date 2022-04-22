//
//  LiteTableGroupCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

class LiteTableGroupCell {
    required init() {
    }
    
    func populateCells() -> [LiteTableCell] { [] }
    
    final func setCells(
        @LiteTableCellBuilder builder: () -> [LiteTableCell]
    ) -> [LiteTableCell] {
        let cells: [LiteTableCell] = builder()
        return cells
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
}
