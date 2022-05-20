//
//  LoadTableCellContract.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

protocol LoadTableCellContract {
    func emptyCell() -> LiteTableCell
    
    func forEachElement<Element>(
        in array: [Element],
        @LiteTableCellBuilder builder: (Int, Element) -> [LiteTableCell]
    ) -> [LiteTableCell]
    
    func loadCell<Cell>(
        dequeue: @escaping (Cell, IndexPath) -> Void
    ) -> LiteTableCell where Cell: UITableViewCell
    func rectangle(
        height: CGFloat,
        color: UIColor,
        identifier: String
    ) -> LiteTableCell
    
    func loadGroupCell<GroupCell>(
        build: (GroupCell) -> Void
    ) -> [LiteTableCell] where GroupCell: LiteTableGroupCell
}

extension LoadTableCellContract {
    func emptyCell() -> LiteTableCell {
        loadCell { (cell: TableCell<UIView>, _) in
            cell.backgroundColor = .clear
        }
        .setHidden(true)
        .setIdentifier("LiteEmptyCell")
    }
}

extension LoadTableCellContract {
    func forEachElement<Element>(
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
}

extension LoadTableCellContract {
    func loadCell<Cell>(
        dequeue: @escaping (Cell, IndexPath) -> Void
    ) -> LiteTableCell where Cell: UITableViewCell {
        let liteCell = LiteTableCell(cellType: Cell.self) { cell, indexPath in
            guard let _cell = cell as? Cell else { return }
            dequeue(_cell, indexPath)
        }
        return liteCell
    }
    
    func rectangle(
        height: CGFloat,
        color: UIColor,
        identifier: String = "LiteRectangleCell"
    ) -> LiteTableCell {
        loadCell { (cell: TableCell<UIView>, _) in
            cell.setHeight(height)
            cell.backgroundColor = color
        }
        .setIdentifier(identifier)
    }
}

extension LoadTableCellContract {
    func loadGroupCell<GroupCell>(
        build: (GroupCell) -> Void
    ) -> [LiteTableCell] where GroupCell: LiteTableGroupCell {
        let groupCell = GroupCell()
        build(groupCell)
        let liteCells: [LiteTableCell] = groupCell.populateCells()
        return liteCells
    }
}
