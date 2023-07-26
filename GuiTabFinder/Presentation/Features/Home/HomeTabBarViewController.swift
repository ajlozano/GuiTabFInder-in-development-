//
//  HomeTabBarViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

final class HomeTabBarViewController: UITabBarController {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.tabBar.backgroundColor = .black
        
        let tabFinderNavigationController = UINavigationController()
        coordinator.showTablatureFinderOperativeWith(navigationController: tabFinderNavigationController)
        
        let tunerNavigationController = UINavigationController()
        coordinator.showTunerOperativeWith(navigationController: tunerNavigationController)
        
        let audioRecorderNavigationController = UINavigationController()
        coordinator.showAudioRecorderOperativeWith(navigationController: audioRecorderNavigationController)
        
        let settingsNavigationController = UINavigationController()
        coordinator.showSettingsOperativeWith(navigationController: settingsNavigationController)
        
        setViewControllers([tabFinderNavigationController, tunerNavigationController, audioRecorderNavigationController, settingsNavigationController], animated: true)
    }
}

