//
//  ExploreTrendingTableViewCell.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

class ExploreTrendingTableViewCell: UITableViewCell {
    
    private let containerView = UIView(frame: .zero)
    private let logoImageContainerView = UIView(frame: .zero)
    private let logoImageView = UIImageView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let subTitleLabel = UILabel(frame: .zero)
    private let statusView = TrendingStatusView(frame: .zero)

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
    
    internal func bind(brandModel: BrandModel) {
        refreshUI(brandModel: brandModel)
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
            contentView.addSubview(containerView)
        }
        
        logoImageView: do {
            logoImageContainerView.layer.cornerRadius = 20.0
            logoImageContainerView.clipsToBounds = true
            logoImageContainerView.layer.borderWidth = 1.0
            logoImageContainerView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
            logoImageView.contentMode = .scaleAspectFit
            logoImageContainerView.backgroundColor = UIColor.white
            logoImageView.backgroundColor = UIColor.clear
            
            containerView.addSubview(logoImageContainerView)
            logoImageContainerView.addSubview(logoImageView)
        }
        
        titleLabel: do {
            titleLabel.textColor = .darkGray
            titleLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
            containerView.addSubview(titleLabel)
        }
        
        subTitleLabel: do {
            subTitleLabel.textColor = .lightGray
            subTitleLabel.font = .systemFont(ofSize: 14.0, weight: .light)
            containerView.addSubview(subTitleLabel)
        }
        
        statusView: do {
            containerView.addSubview(statusView)
        }
    }
    
    private func setupViewContraints() {
        
        let containerViewConstraints = [
            contentView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 64.0)
        ]
        NSLayoutConstraint.activate(containerViewConstraints)
        
        let contentConstriants = [
            logoImageContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24.0),
            logoImageContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12.0),
            logoImageContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12.0),
            logoImageContainerView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -16.0),
            logoImageContainerView.widthAnchor.constraint(equalToConstant: 40.0),
            logoImageView.centerXAnchor.constraint(equalTo: logoImageContainerView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: logoImageContainerView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 30.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 30.0),
            titleLabel.trailingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 24.0),
            titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -2.0),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            statusView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24.0),
            statusView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleLabel.lastBaselineAnchor.constraint(equalTo: statusView.centerYAnchor, constant: -2.0),
        ]
        NSLayoutConstraint.activate(contentConstriants)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        logoImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func refreshUI(brandModel: BrandModel) {
        logoImageView.image = UIImage(named: brandModel.iconUrl ?? "slack")
        titleLabel.text = brandModel.title
        subTitleLabel.text = brandModel.subTitle
        statusView.bind(brandModel: brandModel)
    }

}

internal final class TrendingStatusView: UIView {
    
    private let statusLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func bind(brandModel: BrandModel) {
        refreshUI(brandModel: brandModel)
    }
    
    private func setupView() {
        setupViewConfigs()
        setupViewContraints()
    }
    
    private func setupViewConfigs() {
        baseUI: do {
            backgroundColor = .green
            layer.cornerRadius = 10.0
            clipsToBounds = true
        }
        statusLabel: do {
            statusLabel.textAlignment = .center
            statusLabel.textColor = .white
            statusLabel.font = .systemFont(ofSize: 12.0, weight: .bold)
            addSubview(statusLabel)
        }
    }
    
    private func setupViewContraints() {
        let constraints = [
            self.widthAnchor.constraint(equalToConstant: 72.0),
            self.heightAnchor.constraint(equalToConstant: 20.0),
            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            statusLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func refreshUI(brandModel: BrandModel) {
        statusLabel.text = brandModel.statusText
        statusLabel.backgroundColor = brandModel.statusType.chipColor
    }
}
