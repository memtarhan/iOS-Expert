//
//  SymbolDetailView.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 4.12.2025.
//

import UIKit

class SymbolDetailView: UIView {
    @UsesAutoLayout
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        nameLabel.textAlignment = .center
        return nameLabel
    }()

    @UsesAutoLayout
    private var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont.systemFont(ofSize: 24.0)
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .secondaryLabel
        return categoryLabel
    }()

    @UsesAutoLayout
    private var representationImageView = UIImageView()

    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        [nameLabel, categoryLabel, representationImageView].forEach {
            addSubview($0)
        }

        nameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
        nameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
        nameLabel.bottomAnchor.constraint(equalTo: representationImageView.topAnchor, constant: -Layout.standardSpacing).activate()

        representationImageView.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        representationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        let representationImageWidth: CGFloat = 343
        representationImageView.heightAnchor.constraint(equalToConstant: representationImageWidth).activate()
        representationImageView.widthAnchor.constraint(equalToConstant: representationImageWidth).activate()

        categoryLabel.topAnchor.constraint(equalTo: representationImageView.bottomAnchor, constant: Layout.standardSpacing).activate()
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standardSpacing).activate()
        categoryLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: -Layout.standardSpacing).activate()
    }

    func configure(symbol: Symbol) {
        nameLabel.text = symbol.name
        categoryLabel.text = symbol.category
        representationImageView.image = UIImage(systemName: symbol.name)
    }
}
