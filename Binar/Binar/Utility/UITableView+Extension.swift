//
//  UITableView+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 23/03/22.
//

import UIKit

extension UITableView {
    func registerNibCell<Cell>(_ cellType: Cell.Type) where Cell: UITableViewCell {
        let reusableId: String = "\(cellType)"
        let nib = UINib(nibName: reusableId, bundle: nil)
        register(nib, forCellReuseIdentifier: reusableId)
    }
    
    func registerCell<Cell>(_ cellType: Cell.Type) where Cell: UITableViewCell {
        let reusableId: String = "\(cellType)"
        register(cellType, forCellReuseIdentifier: reusableId)
    }
}
