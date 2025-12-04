// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit
class BrowseSymbolsVC: UIViewController {
    private var symbols: [Symbol]

    private var browseSymbolsView: BrowseSymbolsView {
        if let castedView = view as? BrowseSymbolsView {
            return castedView

        } else {
            fatalError("Could not cast \(self).view to \(BrowseSymbolsView.self).")
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        symbols = []
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = BrowseSymbolsView(frame: UIScreen.main.bounds)
        browseSymbolsView.setupTable(dataSource: self, delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let previousSymbols = symbols
        symbols = Symbol.allSymbolsSorted

        if symbols != previousSymbols {
            browseSymbolsView.tableView.reloadData()
            browseSymbolsView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }
    }
}

extension BrowseSymbolsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        symbols.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(SymbolCell.self)") as? SymbolCell {
            cell.configure(symbol: symbols[indexPath.row])
            return cell

        } else {
            fatalError("Could not initialize \(SymbolCell.self).")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        BrowseSymbolsView.rowHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO:
    }
}
