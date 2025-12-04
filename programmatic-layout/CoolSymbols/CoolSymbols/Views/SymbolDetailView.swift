//
//  SymbolDetailView.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 4.12.2025.
//

import UIKit

class SymbolDetailView: UIView {
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    private var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont.systemFont(ofSize: 24.0)
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .secondaryLabel
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        return categoryLabel
    }()

    private var representationImageView: UIImageView = {
        let representationImageView = UIImageView()
        representationImageView.translatesAutoresizingMaskIntoConstraints = false
        return representationImageView
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        [nameLabel, categoryLabel, representationImageView].forEach {
            addSubview($0)
        }

        nameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: representationImageView.topAnchor, constant: -8.0).isActive = true

        representationImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        representationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        let representationImageWidth: CGFloat = 343
        representationImageView.heightAnchor.constraint(equalToConstant: representationImageWidth).isActive = true
        representationImageView.widthAnchor.constraint(equalToConstant: representationImageWidth).isActive = true

        categoryLabel.topAnchor.constraint(equalTo: representationImageView.bottomAnchor, constant: 8.0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: -8.0).isActive = true
    }

    func configure(symbol: Symbol) {
        nameLabel.text = symbol.name
        categoryLabel.text = symbol.category
        representationImageView.image = UIImage(systemName: symbol.name)
    }
}
