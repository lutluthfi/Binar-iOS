//
//  LiteTableViewAdapter.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

final class LiteTableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var cells: [LiteTableCell] = []
    
    func setCells(_ cells: [LiteTableCell]) {
        self.cells = cells
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
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
}
