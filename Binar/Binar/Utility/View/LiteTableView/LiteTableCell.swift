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
    typealias OnSelectCell = (Cell, IndexPath) -> Void
    
    let cellType: Cell.Type
    var dequeue: DequeueCell
    private(set) var identifier: String
    private(set) var isHidden = false
    private(set) var onSelectCell: OnSelectCell?
    
    init(cellType: Cell.Type, dequeue: @escaping DequeueCell) {
        self.cellType = cellType
        self.dequeue = dequeue
        self.identifier = String(describing: cellType)
    }
    
    @discardableResult func setHidden(_ isHidden: Bool) -> LiteTableCell {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult func setIdentifier(_ identifier: String) -> LiteTableCell {
        self.identifier = identifier
        return self
    }
    
    @discardableResult func onSelectCell(completion: @escaping OnSelectCell) -> LiteTableCell {
        onSelectCell = completion
        return self
    }
}
