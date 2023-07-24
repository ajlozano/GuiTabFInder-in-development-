//
//  SettingsCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 21/7/23.
//

import UIKit

class SettingsCoordinator: ChildCoordinator {
    var parentCoordinator: MainCoordinator
    var childCoordinators = [ChildCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parentCoordinator: MainCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func didFinishForTablatureFinder() {
        parentCoordinator.childDidFinish(self)
    }
}

// MARK: Show Tablature Finder Operative Views

extension SettingsCoordinator {
    func start() {
        let vc = SettingsViewController()
        vc.coordinator = self
        vc.title = "Settings"
        vc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 2)

        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
}
