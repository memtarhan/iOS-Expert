//
//  SettingsView.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 5.12.2025.
//

import UIKit

class SettingsView: UIView {
    @UsesAutoLayout
    private var sortByLabel: UILabel = {
        let sortByLabel = UILabel()
        sortByLabel.text = "Sort by:"
        sortByLabel.font = .boldSystemFont(ofSize: 30.0)
        return sortByLabel
    }()

    @UsesAutoLayout
    private(set) var sortSegmentedControl: UISegmentedControl = {
        let sortSegmentedControl = UISegmentedControl(items: ["Name", "Category"])
        return sortSegmentedControl
    }()

    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        [sortByLabel, sortSegmentedControl].forEach {
            addSubview($0)
        }

        sortByLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: Layout.standardSpacing).activate()
        sortByLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()

        sortSegmentedControl.topAnchor.constraint(equalTo: sortByLabel.bottomAnchor, constant: 20.0).activate()
        sortSegmentedControl.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: Layout.standardSpacing).activate()
        sortSegmentedControl.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -Layout.standardSpacing).activate()
    }
}
