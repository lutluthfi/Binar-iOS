//
//  LiteTableView.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import UIKit

final class LiteTableView: UITableView {
    private let adapter = LiteTableViewAdapter()
    private let queue = DispatchQueue(label: "com.arlt.liteTableView", target: .main)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        dataSource = adapter
        delegate = adapter
        separatorStyle = .none
    }
    
    func load(@LiteTableCellBuilder builder: () -> [LiteTableCell]) {
        let liteCells: [LiteTableCell] = builder()
        
        adapter.setCells(liteCells)
        for liteCell in liteCells {
            registerCell(liteCell.cellType, reuseId: liteCell.identifier)
        }
        
        queue.async { [weak self] in
            self?.reloadData()
        }
    }
}
