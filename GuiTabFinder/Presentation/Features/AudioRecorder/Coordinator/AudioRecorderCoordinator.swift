//
//  AudioRecorderCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit

class AudioRecorderCoordinator: ChildCoordinator {
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

extension AudioRecorderCoordinator {
    func start() {
        let vc = AudioRecorderViewController()
        vc.coordinator = self
        vc.title = "Tuner"
        vc.tabBarItem = UITabBarItem(title: "Recorder", image: UIImage(systemName: "waveform.circle"), tag: 2)
        
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 20)!]
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
}
