//
//  SpinnerViewController+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import UIKit

// MARK: SpinnerViewController - Constraints

extension SpinnerViewController {
    
    func setupSpinnerViewConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
