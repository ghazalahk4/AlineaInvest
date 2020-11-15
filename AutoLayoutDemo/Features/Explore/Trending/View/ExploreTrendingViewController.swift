//
//  ExploreTrendingViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

class ExploreTrendingViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)

    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupConstraints()
        setupTableView()
    }
    
    private func setupConstraints() {
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension ExploreTrendingViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.register(ExploreTrendingTableViewCell.self, forCellReuseIdentifier: String(describing: ExploreTrendingTableViewCell.self))
        tableView.register(ExploreTrendingSectionTitleView.self, forHeaderFooterViewReuseIdentifier: String(describing: ExploreTrendingSectionTitleView.self))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        trendingDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trendingDataSource[section].brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ExploreTrendingTableViewCell.self)) as? ExploreTrendingTableViewCell else { return UITableViewCell() }
        cell.bind(brandModel: trendingDataSource[indexPath.section].brands[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ExploreTrendingSectionTitleView.self)) as? ExploreTrendingSectionTitleView
        headerView?.bind(title: trendingDataSource[section].title)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44.0
    }
    
}
