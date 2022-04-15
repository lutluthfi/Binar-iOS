//
//  RDHomeListCell.swift
//  Binar
//
//  Created by Raden Dimas on 08/04/22.
//

import UIKit

class RDHomeListCell: UITableViewCell {
    
    private lazy var titleCellLabel: UILabel = {
        let titleCell = UILabel()
        titleCell.numberOfLines = 0
        titleCell.adjustsFontSizeToFitWidth = true
        titleCell.font = .systemFont(ofSize: 18, weight: .bold)
        titleCell.translatesAutoresizingMaskIntoConstraints = false
        return titleCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHomeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHomeCell() {
        addSubview(titleCellLabel)
        
        NSLayoutConstraint.activate([
            titleCellLabel.topAnchor.constraint(equalTo: topAnchor),
            titleCellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            titleCellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleCellLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    func fill(with title: RDHomeTitleModel) {
        titleCellLabel.text = title.rawValue
    }
    
}
