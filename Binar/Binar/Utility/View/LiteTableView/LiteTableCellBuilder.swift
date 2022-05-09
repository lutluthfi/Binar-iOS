//
//  LiteTableCellBuilder.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 22/04/22.
//

import Foundation

protocol LiteTableCellConvertible {
    func asLiteCells() -> [LiteTableCell]
}

extension LiteTableCell: LiteTableCellConvertible {
    func asLiteCells() -> [LiteTableCell] { [self] }
}

extension Array: LiteTableCellConvertible where Element == LiteTableCell {
    func asLiteCells() -> [LiteTableCell] {
        self.flatMap { $0.asLiteCells() }
    }
}

extension Array where Element == LiteTableGroupCell {
    func asLiteCells() -> [LiteTableCell] {
        flatMap { $0.populateCells() }
    }
}

@resultBuilder
struct LiteTableCellBuilder {
    static func buildBlock(_ components: LiteTableCell...) -> [LiteTableCell] {
        components
    }
    
    static func buildBlock(_ components: [LiteTableCell]) -> [LiteTableCell] {
        components.compactMap { $0 }
    }
    
    static func buildBlock(_ components: [LiteTableCell]...) -> [LiteTableCell] {
        components.flatMap { $0.compactMap { $0 } }
    }
    
    static func buildBlock(_ components: LiteTableCellConvertible...) -> [LiteTableCell] {
        components.flatMap { $0.asLiteCells() }
    }
}
