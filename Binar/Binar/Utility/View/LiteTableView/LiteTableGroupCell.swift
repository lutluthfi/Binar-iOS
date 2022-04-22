//
//  LiteTableGroupCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

class LiteTableGroupCell: LoadTableCellContract {
    required init() {
    }
    
    func populateCells() -> [LiteTableCell] { [] }
    
    final func setCells(
        @LiteTableCellBuilder builder: () -> [LiteTableCell]
    ) -> [LiteTableCell] {
        let cells: [LiteTableCell] = builder()
        return cells
    }
}
