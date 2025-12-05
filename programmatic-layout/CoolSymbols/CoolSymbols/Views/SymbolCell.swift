// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class SymbolCell: UITableViewCell {
    @UsesAutoLayout
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        return nameLabel
    }()

    @UsesAutoLayout
    private var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont.systemFont(ofSize: 15.0)
        categoryLabel.textColor = .secondaryLabel
        return categoryLabel
    }()

    @UsesAutoLayout
    private var representationImageView = UIImageView()

    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground

        [nameLabel, categoryLabel, representationImageView].forEach {
            addSubview($0)
        }

        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standardSpacing).activate()
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standardSpacing).activate()
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.standardSpacing).activate()

        categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Layout.standardSpacing).activate()
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standardSpacing).activate()
        categoryLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: -Layout.standardSpacing).activate()

        representationImageView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standardSpacing).activate()
        representationImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.standardSpacing).activate()
        let representationImageWidth: CGFloat = 104
        representationImageView.heightAnchor.constraint(equalToConstant: representationImageWidth).activate()
        representationImageView.widthAnchor.constraint(equalToConstant: representationImageWidth).activate()
    }

    func configure(symbol: Symbol) {
        nameLabel.text = symbol.name
        categoryLabel.text = symbol.category
        representationImageView.image = UIImage(systemName: symbol.name)
    }
}
