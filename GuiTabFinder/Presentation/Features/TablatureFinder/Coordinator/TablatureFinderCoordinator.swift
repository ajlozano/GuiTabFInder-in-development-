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
        tablatureFinderViewController.title = "Tab Finder"
        tablatureFinderViewController.tabBarItem = UITabBarItem(title: "Find", image: UIImage(systemName: "music.note.house")?.withRenderingMode(.automatic), tag: 0)

        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(tablatureFinderViewController, animated: false)
    }
    
    func showTablatureDetail(for model: TablatureDetail) {
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        let tablatureDetailViewController = TablatureDetailViewController(inputModel: model)
        tablatureDetailViewController.coordinator = self
        tablatureDetailViewController.title = model.songName
        navigationController.pushViewController(tablatureDetailViewController, animated: true)
    }
}
