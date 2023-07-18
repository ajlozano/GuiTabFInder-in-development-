//
//  MainCoordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [ChildCoordinator]()
}

// MARK: Main Coordinator - Show operative methods

extension MainCoordinator {
    
    func showTablatureFinderOperativeWith(navigationController: UINavigationController) {
        let tabFinderCoordinator = TablatureFinderCoordinator(navigationController: navigationController, parentCoordinator: self)
        tabFinderCoordinator.start()
        childCoordinators.append(tabFinderCoordinator)
    }
    
    func showTunerOperativeWith(navigationController: UINavigationController) {
        let tunerCoordinator = TunerCoordinator(navigationController: navigationController, parentCoordinator: self)
        tunerCoordinator.start()
        childCoordinators.append(tunerCoordinator)
    }
    
    func showAudioRecorderOperativeWith(navigationController: UINavigationController) {
        let audioRecorderCoordinator = AudioRecorderCoordinator(navigationController: navigationController, parentCoordinator: self)
        audioRecorderCoordinator.start()
        childCoordinators.append(audioRecorderCoordinator)
    }
}

// MARK: Manage Remove Child Coordinators

extension MainCoordinator {
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
