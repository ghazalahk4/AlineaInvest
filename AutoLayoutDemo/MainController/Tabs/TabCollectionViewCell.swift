//
//  TabCollectionViewCell.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal protocol TabSelectionDelegate: class {
    func tabSelected(withTabModel tabModel: TabModel, index: Int)
}

internal final class TabCollectionViewCell: UICollectionViewCell {
    
    private let containerView = UIView()
    private let iconImageView = UIImageView()
    private weak var delegate: TabSelectionDelegate?
    private var tabModel: TabModel?
    private var index: Int?
    var selectorViewColor: UIColor = UIColor(red: 74.0/255.0, green: 84.0/255.0, blue: 191.0/255.0, alpha: 1.0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func bind(tabModel: TabModel,
                       index: Int,
                       delegate: TabSelectionDelegate?) {
        self.tabModel = tabModel
        self.index = index
        self.delegate = delegate
        iconImageView.image = tabModel.tab.iconImage?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = tabModel.isTabSelected ? .white : selectorViewColor
        containerView.backgroundColor = tabModel.isTabSelected ? selectorViewColor : .white
    }
    
    private func setupView() {
        baseUI: do {
            backgroundColor = .white
        }
        
        containerView: do {
            containerView.layer.cornerRadius = 4.0
            containerView.clipsToBounds = true
            containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            contentView.addSubview(containerView)
        }

        iconImageView: do {
            iconImageView.contentMode = .scaleAspectFit
            containerView.addSubview(iconImageView)
        }
        
        addTapGesture: do {
            let tapGesture  = UITapGestureRecognizer()
            tapGesture.numberOfTapsRequired = 1
            tapGesture.addTarget(self, action: #selector(selected))
            contentView.addGestureRecognizer(tapGesture)
        }
        
        setupViewContraints()
    }
    
    private func setupViewContraints() {
        let constraints = [
            containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12.0),
            containerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 20.0),
            iconImageView.widthAnchor.constraint(equalToConstant: 20.0)
        ]
        NSLayoutConstraint.activate(constraints)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func selected() {
        guard let tabModel = tabModel,
              let index = index else {
            return
        }
        delegate?.tabSelected(withTabModel: tabModel, index: index)
    }
    
    internal func resetTabSelection() {
        containerView.backgroundColor = .white
        iconImageView.tintColor = selectorViewColor
    }
    
    internal func setSelectedTabState() {
        containerView.backgroundColor = selectorViewColor
        iconImageView.tintColor = .white
    }
    
}
