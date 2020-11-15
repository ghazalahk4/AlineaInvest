//
//  ExploreCategoryViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal final class ExploreCategoryViewController: UIViewController {
    
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

extension ExploreCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 12.0, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.register(ExploreCategoryTableViewCell.self, forCellReuseIdentifier: String(describing: ExploreCategoryTableViewCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ExploreCategoryTableViewCell.self)) as? ExploreCategoryTableViewCell else { return UITableViewCell() }
        cell.bind(categoryModel: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}


