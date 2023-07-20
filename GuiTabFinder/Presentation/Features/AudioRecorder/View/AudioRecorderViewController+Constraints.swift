//
//  AudioRecorderViewController+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit

extension AudioRecorderViewController {
    func setupAudioRecorderViewConstraints() {
        // Create and activate the constraints for the swiftui's view.
        NSLayoutConstraint.activate([
            recorderConductorView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 0),
            recorderConductorView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: 0),
            recorderConductorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            recorderConductorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}
