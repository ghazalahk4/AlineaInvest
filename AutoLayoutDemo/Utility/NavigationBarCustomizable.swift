//
//  NavigationBarCustomizable.swift
//
//  Created by Ghazalah on 13/11/20.
//

import UIKit

protocol NavigationBarCustomizable {
    func setupAppThemeNavigationBar()
}

extension NavigationBarCustomizable where Self: UIViewController {
    
    func setupAppThemeNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false

        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        
        let sideMenuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = sideMenuButton

        let notificationButton = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = notificationButton
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkGray]

    }
    
}


