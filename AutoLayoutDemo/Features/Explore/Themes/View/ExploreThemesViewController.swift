//
//  ExploreThemesViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal final class ExploreThemesViewController: UIViewController {
    
    private let tabCollectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 24.0
        layout.minimumInteritemSpacing = 24.0
        
        return layout
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: tabCollectionViewLayout)

    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        baseUI: do {
            view.backgroundColor = .white
        }
        setupConstraints()
        setupTabCollectionView()
    }
    
    private func setupConstraints() {
        
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.updateConstraints()
    }
}

extension ExploreThemesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupTabCollectionView() {
        registerCells()
        collectionView.contentInset = UIEdgeInsets(top: 12.0, left: 24, bottom: 12.0, right: 24)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCells() {
        collectionView.register(ExploreThemeCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: ExploreThemeCollectionViewCell.self))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ExploreThemeCollectionViewCell.self), for: indexPath) as? ExploreThemeCollectionViewCell else { return UICollectionViewCell() }
        cell.bind(themeModel: themes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width/2)-24.0-12.0 // 24 for adjusting content inset and 12 to adjust InteritemSpacing.
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
