//
//  TablatureFinderTableViewCell+Constraints.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 12/7/23.
//

import UIKit

// MARK: TablatureFinderTableViewCell - Setup Constraints

extension TablatureFinderTableViewCell {
    func setupShadowViewConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
    
    func setupSongLabelConstraints() {
        NSLayoutConstraint.activate([
            songLabel.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 10),
            songLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10)
        ])
    }
    
    func setupArtistLabelConstraints() {
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 5),
            artistLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10),
            artistLabel.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -10)
        ])
    }
    
    func setupRatingConstraints() {
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 7),
            ratingView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -7),
            ratingView.leadingAnchor.constraint(equalTo: songLabel.trailingAnchor, constant: 5),
            ratingView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: ratingView.topAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            ratingLabel.heightAnchor.constraint(equalTo: songLabel.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            ratingValueLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor),
            ratingValueLabel.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor),
            ratingValueLabel.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            ratingValueLabel.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor)
        ])
    }
    
    func setupVotesConstraints() {
        NSLayoutConstraint.activate([
            votesView.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: 7),
            votesView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -7),
            votesView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -10),
            votesView.leadingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: 5),
            votesView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            votesLabel.topAnchor.constraint(equalTo: votesView.topAnchor),
            votesLabel.trailingAnchor.constraint(equalTo: votesView.trailingAnchor),
            votesLabel.leadingAnchor.constraint(equalTo: votesView.leadingAnchor),
            votesLabel.heightAnchor.constraint(equalTo: songLabel.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            votesValueLabel.topAnchor.constraint(equalTo: votesLabel.bottomAnchor),
            votesValueLabel.trailingAnchor.constraint(equalTo: votesView.trailingAnchor),
            votesValueLabel.leadingAnchor.constraint(equalTo: votesView.leadingAnchor),
            votesValueLabel.bottomAnchor.constraint(equalTo: votesView.bottomAnchor)
        ])
    }
}
