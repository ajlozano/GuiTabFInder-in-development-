//
//  HomeTabBarViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

final class HomeTabBarViewController: UITabBarController {
    var coordinator: MainCoordinator?
    
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
        let tabFinderNavigationController = UINavigationController()
        coordinator?.showTablatureFinderOperativeWith(navigationController: tabFinderNavigationController)
        
        setViewControllers([tabFinderNavigationController], animated: true)
    }
}

