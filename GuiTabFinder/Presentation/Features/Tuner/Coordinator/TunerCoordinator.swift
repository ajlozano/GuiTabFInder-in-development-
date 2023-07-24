//
//  TunerCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit

class TunerCoordinator: ChildCoordinator {
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

// MARK: Show Tuner Operative Views

extension TunerCoordinator {
    func start() {
        let vc = TunerViewController()
        vc.coordinator = self
        vc.title = "Tuner"
        vc.tabBarItem = UITabBarItem(title: "Tuner", image: UIImage(systemName: "tuningfork"), tag: 1)
        
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
}
