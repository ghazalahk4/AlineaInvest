//
//  ExploreThemeCollectionViewCell.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal final class ExploreThemeCollectionViewCell: UICollectionViewCell {
    
    private let containerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let iconImageView = UIImageView(frame: .zero)
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func bind(themeModel: ExploreThemeModel) {
        refreshUI(themeModel: themeModel)
    }
    
    private func setupView() {
        setupViewConfigs()
        setupViewContraints()
    }
    
    private func setupViewConfigs() {
        baseUI: do {
            contentView.addSubview(containerView)
        }
        
        containerView: do {
            containerView.layer.cornerRadius = 8.0
            containerView.clipsToBounds = true

            containerView.layer.borderWidth = 1.0
            containerView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
            containerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        }
        
        titleLabel: do {
            titleLabel.textAlignment = .center
            titleLabel.textColor = .darkGray
            titleLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
            titleLabel.numberOfLines = 2
            containerView.addSubview(titleLabel)
        }
        
        iconImageView: do {
            iconImageView.contentMode = .scaleAspectFit
            containerView.addSubview(iconImageView)
        }
    }
    
    private func setupViewContraints() {
        let baseConstraints = [
            contentView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ]
        NSLayoutConstraint.activate(baseConstraints)
        
        let contentConstraints = [
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            iconImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.6),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
        ]
        NSLayoutConstraint.activate(contentConstraints)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    private func refreshUI(themeModel: ExploreThemeModel) {
        iconImageView.image = UIImage(named: themeModel.iconUrl ?? "diversity_inclusion")
        titleLabel.text = themeModel.title
    }
    
}
