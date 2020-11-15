//
//  TabMainViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

class TabMainViewController: UIViewController {

    private let tabCollectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        return layout
    }()
    
    private lazy var tabCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tabCollectionViewLayout)
    
    private let containerViewController = ContainerViewController()
    
    override func loadView() {
        super.loadView()
        view.addSubview(tabCollectionView)
        self.addChild(containerViewController)
        view.addSubview(containerViewController.view)
        containerViewController.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white

        setupViewContraints()
        setupTabCollectionView()
    }
    
    private func setupViewContraints() {
        let constraints = [
            containerViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerViewController.view.bottomAnchor.constraint(equalTo: tabCollectionView.topAnchor),
            tabCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabCollectionView.heightAnchor.constraint(equalToConstant: 52.0)
        ]
        NSLayoutConstraint.activate(constraints)
        containerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        tabCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.updateConstraints()
    }
}


extension TabMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupTabCollectionView() {
        registerCells()
        tabCollectionView.backgroundColor = .red
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
    }
    
    private func registerCells() {
        tabCollectionView.register(TabCollectionViewCell.self,
                                   forCellWithReuseIdentifier: String(describing: TabCollectionViewCell.self))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TabCollectionViewCell.self), for: indexPath) as? TabCollectionViewCell else { return UICollectionViewCell() }
        
        cell.bind(tabModel: TabModel.tabs[indexPath.row],
                  index: indexPath.row,
                  delegate: self)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TabModel.tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/5
        return CGSize(width: width, height: 52.0)
    }
}

extension TabMainViewController: TabSelectionDelegate {
    func tabSelected(withTabModel tabModel: TabModel, index: Int) {
        tabCollectionView.visibleCells.forEach { (cell) in
            guard let tabCell = cell as? TabCollectionViewCell else {
                return
            }
            tabCell.resetTabSelection()
        }
        guard let tabCell = tabCollectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? TabCollectionViewCell else {
            return
        }
        tabCell.setSelectedTabState()
        containerViewController.changeViewController(toIndex: index)
    }
}
