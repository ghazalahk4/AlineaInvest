//
//  ComingSoonViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

class ComingSoonViewController: UIViewController, NavigationBarCustomizable {

    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    init(color: UIColor = .white,
         pageTitle: String = "Home") {
        super.init(nibName: nil, bundle: nil)
        title = pageTitle
        view.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupAppThemeNavigationBar()
    }

    private func setupView() {
        titleLabel: do {
            titleLabel.text = "Coming Soon!"
            titleLabel.textAlignment = .center
            titleLabel.font = .systemFont(ofSize: 24.0, weight: .bold)
            titleLabel.textColor = .darkGray
        }
        
        subTitleLabel: do {
            subTitleLabel.text = "This is page is under development will be coming soon."
            subTitleLabel.textAlignment = .center
            subTitleLabel.font = .systemFont(ofSize: 16.0)
            subTitleLabel.textColor = .lightGray
            subTitleLabel.numberOfLines = 0
        }
        
        setupViewConstraints()
    }
    
    private func setupViewConstraints() {

        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32.0),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64.0),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.updateConstraints()
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let arr: [[Int]] = [[0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,1,1,1,0,0,0,0],
                            [0,0,1,1,1,0,0,0,0],
                            [0,0,1,1,1,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0]]
        searchSmallMetric2(arr: arr, x: 9, y: 9)
    }
    
    func searchSmallMetric2(arr: [[Int]], x: Int, y: Int) {
        let minM: Int = Int(x/4)+1
        let minN: Int = Int(y/4)+1
        
        var firstIndex: (Int, Int) = (-1,-1)
        outerLoop: for i in 0..<x-minM {
            for j in 0..<y-minN {
                if arr[i][j] == 1 {
                    firstIndex = (i, j)
                    break outerLoop
                }
            }
        }
        guard firstIndex.0 != -1 && firstIndex.1 != -1 else {
            print("1 not present in output")
            return
        }
        var m: Int = minM
        var n: Int = minN

        for i in firstIndex.0..<x {
            let j = firstIndex.1
            if (arr[i][j] == 0) {
                m = i-firstIndex.0
                break
            }
        }
        for j in firstIndex.1..<x {
            let i = firstIndex.0
            if (arr[i][j] == 0) {
                n = j-firstIndex.1
                break
            }
        }
        let lastIndex: (Int, Int) = (firstIndex.0+(m-1),
                                     firstIndex.1+(n-1))
        print(firstIndex, lastIndex)
    }

    
    func searchSmallMetric(arr: [[Int]], x: Int, y: Int) {
        let minM: Int = Int(x/4)+1
        let minN: Int = Int(y/4)+1
        
        var firstIndex: (Int, Int) = (-1,-1)
        outerLoop: for i in 0..<minM {
            for j in 0..<minN {
                let indexI = i*minM
                let indexJ = j*minN
                if arr[indexI][indexJ] == 1 {
                    firstIndex = (indexI, indexJ)
                    break outerLoop
                }
            }
        }
        guard firstIndex.0 != -1 && firstIndex.1 != -1 else {
            print("1 not present in output")
            return
        }
        var m: Int = minM
        var n: Int = minN
        for i in firstIndex.0..<x {
            let j = firstIndex.1
            if (arr[i][j] == 0) {
                m = i-firstIndex.0
                break
            }
        }
        for j in firstIndex.1..<x {
            let i = firstIndex.0
            if (arr[i][j] == 0) {
                n = j-firstIndex.1
                break
            }
        }
        let lastIndex: (Int, Int) = (firstIndex.0+(m-1),
                                     firstIndex.1+(n-1))
        print(firstIndex, lastIndex)
    }

}
