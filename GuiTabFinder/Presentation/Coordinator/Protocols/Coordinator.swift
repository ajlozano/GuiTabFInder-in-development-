//
//  Coordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [ChildCoordinator] { get set }
}
