//
//  ARChallenge4ViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 01/04/22.
//

import UIKit

fileprivate enum CellType {
    case topCell
    case contentCell
}

final class ARChallenge4ViewController: UIViewController {
    lazy var tableView: UITableView = makeTableView()
    lazy var headerImageView: UIImageView = makeHeaderImageView()
    
    private lazy var headerFrame: CGRect = makeHeaderFrame()
    private lazy var cellTypes: [CellType] = {
        let contentCells = Array(repeating: CellType.contentCell, count: 100)
        let cellTypes: [CellType] = [.topCell] + contentCells
        return cellTypes
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
        setupView()
    }
    
    private func setupAddSubview() {
        view.addSubview(tableView)
        tableView.backgroundView?.addSubview(headerImageView)
    }
    
    private func setupConstraint() {
        tableView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
             $0.topAnchor.constraint(equalTo: self.view.topAnchor),
             $0.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        }
    }
    
    private func setupView() {
    }
    
    private func makeHeaderFrame() -> CGRect {
        let screenFrame = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 0, width: screenFrame.width, height: 300)
        return frame
    }
    
    private func makeHeaderImageView() -> UIImageView {
        var _headerFrame: CGRect = headerFrame
        _headerFrame.size.height += 150
        let view = UIImageView(frame: _headerFrame)
        view.contentMode = .scaleAspectFill
        view.loadImage(resource: "https://img.okezone.com/content/2021/06/17/406/2426639/mulai-28-juni-swiss-izinkan-wisatawan-memasuki-negaranya-VOHf0jbN2a.jpg")
        return view
    }
    
    private func makeTableView() -> UITableView {
        let view = UITableView()
        view.separatorStyle = .none
        view.delegate = self
        view.dataSource = self
        view.registerCell(ARChallenge4TopTableCell.self)
        view.registerCell(UITableViewCell.self)
        
        let backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            return view
        }()
        view.backgroundView = backgroundView
        
        let tableHeaderView: UIView = {
            let view = UIView(frame: headerFrame)
            return view
        }()
        view.tableHeaderView = tableHeaderView
        
        return view
    }
}

extension ARChallenge4ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfCell: Int = cellTypes.count
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: Int = indexPath.row
        let cellType: CellType = cellTypes[row]
        switch cellType {
        case .topCell:
            return dequeueTopCell(in: tableView, at: indexPath)
        default:
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "UITableViewCell",
                for: indexPath
            )
            
            reusableCell.textLabel?.text = "Row: \(row)"
            
            return reusableCell
        }
    }
    
    private func dequeueTopCell(
        in tableView: UITableView,
        at indexPath: IndexPath
    ) -> UITableViewCell {
        let row: Int = indexPath.row
        let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: "ARChallenge4TopTableCell",
            for: indexPath
        )
        
        if let cell = reusableCell as? ARChallenge4TopTableCell {
            cell.textLabel?.text = "Row: \(row)"
        }
        
        return reusableCell
    }
}

extension ARChallenge4ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44)
        let view = UIView(frame: frame)
        
        return view
    }
}

final class ARChallenge4TopTableCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.masksToBounds = true
    }
}
