//
//  BrowseSymbolsView.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 4.12.2025.
//

import UIKit

class BrowseSymbolsView: UIView {
    static let rowHeight: CGFloat = 120.0

    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = BrowseSymbolsView.rowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true
    }

    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(SymbolCell.self, forCellReuseIdentifier: "\(SymbolCell.self)")
    }
}
