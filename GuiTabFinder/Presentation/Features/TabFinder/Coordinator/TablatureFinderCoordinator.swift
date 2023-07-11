//
//  TabFinderCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

class TablatureFinderCoordinator: ChildCoordinator {
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

extension TablatureFinderCoordinator {
    func start() {
        let tablatureFinderViewController = TablatureFinderViewController()
        tablatureFinderViewController.coordinator = self
        tablatureFinderViewController.title = "Tablature_Finder_Navigation_Title"
        tablatureFinderViewController.tabBarItem = UITabBarItem(title: "Characters_Navigation_Title", image: UIImage(systemName: "person.3")?.withRenderingMode(.automatic), tag: 0)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(tablatureFinderViewController, animated: false)
    }
}
