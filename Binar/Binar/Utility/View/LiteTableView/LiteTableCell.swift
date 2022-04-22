//
//  LiteTableCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

final class LiteTableCell {
    typealias Cell = UITableViewCell
    typealias DequeueCell = (Cell, IndexPath) -> Void
    
    let cellType: Cell.Type
    var dequeue: DequeueCell
    private(set) var identifier: String
    
    init(cellType: Cell.Type, dequeue: @escaping DequeueCell) {
        self.cellType = cellType
        self.dequeue = dequeue
        self.identifier = String(describing: cellType)
    }
    
    func setIdentifier(_ identifier: String) -> LiteTableCell {
        self.identifier = identifier
        return self
    }
}

