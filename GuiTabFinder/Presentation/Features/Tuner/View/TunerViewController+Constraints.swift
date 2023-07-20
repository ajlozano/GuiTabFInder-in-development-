//
//  TunerViewController+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit

extension TunerViewController {
    func setupTunerViewConstraints() {
        // Create and activate the constraints for the swiftui's view.
        NSLayoutConstraint.activate([
            tunerConductorView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 0),
            tunerConductorView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: 0),
            tunerConductorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tunerConductorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}
