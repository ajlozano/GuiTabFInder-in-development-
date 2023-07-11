//
//  ChildCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: MainCoordinator { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
