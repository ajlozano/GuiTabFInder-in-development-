//
//  TabFinderCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

// MARK:

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
        let vc = TablatureFinderViewController()
        vc.coordinator = self
        vc.title = "Tab Finder"
        vc.tabBarItem = UITabBarItem(title: "Find", image: UIImage(systemName: "music.note.house")?.withRenderingMode(.automatic), tag: 0)

        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTablatureDetail(for model: TablatureDetail) {
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        let vc = TablatureDetailViewController(inputModel: model)
        vc.coordinator = self
        vc.title = model.songName
        navigationController.pushViewController(vc, animated: true)
    }
}
