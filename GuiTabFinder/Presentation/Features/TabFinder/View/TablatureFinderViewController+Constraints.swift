//
//  TablatureFinderViewController+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

// MARK: TablatureFinderViewController - Constraints

extension TablatureFinderViewController {
    func setupTablaturesTableViewConstraints() {
        NSLayoutConstraint.activate([
            tablaturesTableView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            tablaturesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tablaturesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tablaturesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
