//
//  ContainerViewController.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

internal struct TabModel {
    internal enum Tab {
        case home
        case explore
        case portfolio
        case shared
        case tips
        
        internal var iconImage: UIImage? {
            switch self {
            case .home:
                return UIImage(named: "users")
            case .explore:
                return UIImage(named: "search")
            case .portfolio:
                return UIImage(named: "stocks_graph")
            case .shared:
                return UIImage(named: "users")
            case .tips:
                return UIImage(named: "energy")
            }
        }
    }
    
    let tab: Tab
    var isTabSelected: Bool
    
    internal static let tabs: [TabModel] = [TabModel(tab: .home, isTabSelected: false),
                                            TabModel(tab: .explore, isTabSelected: true),
                                            TabModel(tab: .portfolio, isTabSelected: false),
                                            TabModel(tab: .shared, isTabSelected: false),
                                            TabModel(tab: .tips, isTabSelected: false)]
}

internal final class ContainerViewController: UIViewController {

    private var containers: [UINavigationController] = []
    private let pageController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: nil)
    private var currentIndex: Int = 1
    
    override func loadView() {
        super.loadView()
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupContainers()
        setupPageController()
    }
    
    private func setupContainers() {
        let viewControllers = TabModel.tabs.map { (tabModel) -> UIViewController in
            switch tabModel.tab {
            case .home:
                return ComingSoonViewController()
            case .explore:
                return ExploreViewController()
            case .portfolio:
                return ComingSoonViewController(pageTitle: "Portfolio")
            case .shared:
                return ComingSoonViewController(pageTitle: "Users")
            case .tips:
                return ComingSoonViewController(pageTitle: "Tips")
            }
        }
        containers = viewControllers.map({ (vc) -> UINavigationController in
            UINavigationController(rootViewController: vc)
        })
    }
    

    private func setupPageController() {
        pageController.view.backgroundColor = .clear
        self.changeViewController(toIndex: currentIndex)
    }
    
    internal func changeViewController(toIndex index: Int) {
        guard index >= 0,
              index < containers.count else {
            return
        }
        pageController.setViewControllers([containers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        currentIndex = index
    }
}
