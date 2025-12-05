//
//  BrowseSymbolsView.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 4.12.2025.
//

import UIKit

class BrowseSymbolsView: UIView {
    static let rowHeight: CGFloat = 120.0

    @UsesAutoLayout
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = BrowseSymbolsView.rowHeight
        return tableView
    }()

    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.standardSpacing).activate()
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).activate()
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).activate()
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.standardSpacing).activate()
    }

    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(SymbolCell.self, forCellReuseIdentifier: "\(SymbolCell.self)")
    }
}
