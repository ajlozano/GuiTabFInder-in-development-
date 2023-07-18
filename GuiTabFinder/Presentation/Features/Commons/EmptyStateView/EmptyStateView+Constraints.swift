//
//  EmptyStateView+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import UIKit

// MARK: EmptyStateView - Constraints

extension EmptyStateView {
    
    private enum Constraints {
        static let animationViewLeading: CGFloat = 20.0
        static let animationViewTrailing: CGFloat = 20.0
        static let animationViewBottom: CGFloat = 20.0
    }
    
    func setupMessageLabelConstraints() {
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: topAnchor),
            message.leadingAnchor.constraint(equalTo: leadingAnchor),
            message.trailingAnchor.constraint(equalTo: trailingAnchor),
            message.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
