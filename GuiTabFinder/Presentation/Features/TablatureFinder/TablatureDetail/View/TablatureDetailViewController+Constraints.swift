//
//  TablatureDetailViewController+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 12/7/23.
//

import UIKit

// MARK: TablatureDetailViewController - Constraints

extension TablatureDetailViewController {
    func setupTablatureDetailArtistLabelConstraints() {
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 10),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            artistLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setupTablatureDetailTuningLabelConstraints() {
        NSLayoutConstraint.activate([
            tuningLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 10),
            tuningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tuningLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tuningLabel.heightAnchor.constraint(equalTo: artistLabel.heightAnchor)
        ])
    }
    
    func setupTablatureDetailScrollViewConstraints() {
        NSLayoutConstraint.activate([
            tablaturesScrollView.topAnchor.constraint(equalTo: tuningLabel.bottomAnchor, constant: 10),
            tablaturesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tablaturesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tablaturesScrollView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -10)
        ])
    }
    
    func setupTablatureDetailTablatureTextViewConstraints() {
        NSLayoutConstraint.activate([
            tabTextView.topAnchor.constraint(equalTo: tablaturesScrollView.topAnchor),
            tabTextView.leadingAnchor.constraint(equalTo: tablaturesScrollView.leadingAnchor),
            tabTextView.trailingAnchor.constraint(equalTo: tablaturesScrollView.trailingAnchor),
            tabTextView.bottomAnchor.constraint(equalTo: tablaturesScrollView.bottomAnchor)
        ])
    }
    
    func setupTablatureDetailEmptyStateLabelConstraints() {
        NSLayoutConstraint.activate([
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
