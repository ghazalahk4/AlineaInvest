//
//  ExploreViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal final class ExploreViewController: UIViewController, NavigationBarCustomizable {
    private let segmentView = CustomSegmentedControl(frame: .zero, buttonTitle: ["Category",
                                                                                 "Themes",
                                                                                 "Trending"])
    private let pageController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: nil)
    
    private let controllers: [UIViewController] = [ExploreCategoryViewController(),
                                                   ExploreThemesViewController(),
                                                   ExploreTrendingViewController()]
    
    private var currentIndex: Int = 0

    override func loadView() {
        super.loadView()
        view.addSubview(segmentView)
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
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
        baseUI: do {
            title = "Explore"
            view.backgroundColor = .white
        }
        
        segmentView: do {
            segmentView.delegate = self
            segmentView.backgroundColor = .clear
        }
        
        pageController: do {
            pageController.view.backgroundColor = .clear
        }
        
        setupViewConstraints()
        setupPageController()
    }
    
    private func setupViewConstraints() {

        let constraints = [
            segmentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            segmentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            segmentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentView.heightAnchor.constraint(equalToConstant: 40.0),
            pageController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageController.view.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 2.0),
            pageController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPageController() {
        self.changeViewController(toIndex: currentIndex)
    }
    
    internal func changeViewController(toIndex index: Int) {
        guard index >= 0,
              index < controllers.count else {
            return
        }
        pageController.setViewControllers([controllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        currentIndex = index
    }

}

extension ExploreViewController: CustomSegmentedControlDelegate {
    func change(to index:Int) {
        changeViewController(toIndex: index)
    }
}
