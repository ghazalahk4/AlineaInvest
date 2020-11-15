//
//  ExploreCategoryTableViewCell.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal final class ExploreCategoryTableViewCell: UITableViewCell {
    
    private let containerView = UIView(frame: .zero)
    private let logoImageContainerView = UIView(frame: .zero)
    private let logoImageView = UIImageView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal func bind(categoryModel: ExploreCategoryModel) {
        refreshUI(categoryModel: categoryModel)
    }
    
    private func setupView() {
        setupViewConfigs()
        setupViewContraints()
    }
    
    private func setupViewConfigs() {
        cellUI: do {
            backgroundColor = .white
            selectionStyle = .none
        }
            
        containerUI: do {
            containerView.layer.cornerRadius = 36.0
            containerView.clipsToBounds = true
            contentView.addSubview(containerView)
        }
        
        logoImageView: do {
            logoImageContainerView.layer.cornerRadius = 20.0
            logoImageContainerView.clipsToBounds = true
            logoImageContainerView.layer.borderWidth = 2.0
            logoImageContainerView.layer.borderColor = UIColor.white.cgColor
            logoImageView.contentMode = .scaleAspectFit
            
            containerView.addSubview(logoImageContainerView)
            logoImageContainerView.addSubview(logoImageView)

        }
        
        titleLabel: do {
            titleLabel.textColor = .white
            titleLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
            containerView.addSubview(titleLabel)
        }
    }
    
    private func setupViewContraints() {
        
        let containerViewConstraints = [
            contentView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
            containerView.heightAnchor.constraint(equalToConstant: 72.0)
        ]
        NSLayoutConstraint.activate(containerViewConstraints)
        
        let contentConstriants = [
            logoImageContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24.0),
            logoImageContainerView.widthAnchor.constraint(equalToConstant: 40.0),
            logoImageContainerView.heightAnchor.constraint(equalToConstant: 40.0),
            logoImageContainerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: logoImageContainerView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: logoImageContainerView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 24.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 24.0),
            titleLabel.leadingAnchor.constraint(equalTo: logoImageContainerView.trailingAnchor, constant: 12.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24.0),
            titleLabel.centerYAnchor.constraint(equalTo: logoImageContainerView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(contentConstriants)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        logoImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func refreshUI(categoryModel: ExploreCategoryModel) {
        logoImageView.image = UIImage(named: categoryModel.iconUrl ?? "stocks")
        titleLabel.text = categoryModel.title
        containerView.backgroundColor = categoryModel.backgroundColor
    }

}
