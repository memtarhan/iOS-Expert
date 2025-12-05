//
//  MainTabBarVC.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 4.12.2025.
//

import UIKit

class MainTabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let browserSymbolsVC = BrowseSymbolsVC()
        browserSymbolsVC.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "eye.fill"), selectedImage: nil)
        let browserSymbolsNC = UINavigationController(rootViewController: browserSymbolsVC)

        let settingsVC = SettingVC()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle.fill"), selectedImage: nil)

        viewControllers = [browserSymbolsNC, settingsVC]
    }
}
