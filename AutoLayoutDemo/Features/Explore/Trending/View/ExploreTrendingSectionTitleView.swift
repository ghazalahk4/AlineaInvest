//
//  ExploreTrendingSectionTitleView.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal final class ExploreTrendingSectionTitleView: UITableViewHeaderFooterView {
    
    private let contianerView = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func bind(title: String) {
        titleLabel.text = title
    }
    
    private func setupView() {
        setupUIConfigs()
        setupViewContraints()
    }
    
    private func setupUIConfigs() {
        baseUI: do {
            backgroundColor = .white
        }
        
        contianerView: do {
            contianerView.backgroundColor = .white
            contentView.addSubview(contianerView)
        }
        
        titleLabel: do {
            titleLabel.textColor = .darkGray
            titleLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
            contianerView.addSubview(titleLabel)
        }
    }
    
    private func setupViewContraints() {
        let constraints = [
            contentView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            contianerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contianerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contianerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contianerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            titleLabel.topAnchor.constraint(equalTo: contianerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contianerView.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: contianerView.trailingAnchor, constant: -20.0),
            titleLabel.bottomAnchor.constraint(equalTo: contianerView.bottomAnchor, constant: -6.0),
            contianerView.heightAnchor.constraint(equalToConstant: 44.0)
        ]
        NSLayoutConstraint.activate(constraints)
        contianerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
