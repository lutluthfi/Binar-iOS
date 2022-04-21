//
//  IGHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGHomeViewController: LiteTableViewController {
    lazy var creatorView = IGFeedCreatorView()
    
    private let instagramAPI = InstagramAPI(appId: "6249791f9296122eca0475be")
    
    private var displayedFeed: [IGFeedResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
//        instagramAPI.getFeeds { [weak self] result in
//            switch result {
//            case let .success(data):
//                self?.displayedFeed = data.data
//            case .failure:
//                break
//            }
//        }
    }
    
    private func render() {
        loadTableView {
            forEachElement(in: Array(0...10)) { row, number in
                loadCell { (cell: TableCell<UILabel>, _) in
                    cell.setHeight(44)
                    cell.content.text = "Number: \(number)"
                }
                loadCell { (cell: TableCell<UIView>, _) in
                    cell.setHeight(44)
                    cell.content.backgroundColor = .systemRed
                }
            }
        }
    }
}

class LiteTableViewController: UIViewController {
    private lazy var tableView = LiteTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            $0.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        })
    }
    
    final func loadTableView(@LiteTableCellBuilder builder: () -> [LiteTableCell]) {
        tableView.load(builder: builder)
    }
    
    final func loadCell<Cell>(
        dequeue: @escaping (Cell, IndexPath) -> Void
    ) -> LiteTableCell where Cell: UITableViewCell {
        let liteCell = LiteTableCell(cellType: Cell.self) { cell, indexPath in
            guard let _cell = cell as? Cell else { return }
            dequeue(_cell, indexPath)
        }
        return liteCell
    }
    
    final func forEachElement<Element>(
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
    
    func setIdentifier(_ identifier: String) {
        self.identifier = identifier
    }
}

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

@resultBuilder
struct LiteTableCellBuilder {
    static func buildBlock(_ components: LiteTableCell...) -> [LiteTableCell] {
        components
    }
    
    static func buildBlock(_ components: [LiteTableCell]) -> [LiteTableCell] {
        components.compactMap { $0 }
    }
    
    static func buildBlock(_ components: LiteTableCellConvertible...) -> [LiteTableCell] {
        components.flatMap { $0.asLiteCells() }
    }
}
