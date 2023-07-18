//
//  TablatureFinderTableViewCell+Constants.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 13/7/23.
//

import UIKit

// MARK: TablatureFinderTableViewCell - Constants
 
extension TablatureFinderTableViewCell {
    enum Constants {
        static let shadowViewCornerRadius: CGFloat = 3
        static let shadowViewOffset = CGSize(width: 0, height: 1.75)
        static let shadowViewRadius: CGFloat = 1
        static let shadowViewOpacity: Float = 0.45
        
        static let ratingLabel: String = "Rating"
        static let votesLabel: String = "Votes"
    }
    
    enum Fonts {
        static let song = UIFont(name: "Helvetica-Bold", size: 12)
        static let artist = UIFont(name: "Helvetica-LightOblique", size: 12)
        static let ratingAndVotesLabels = UIFont(name: "Helvetica", size: 10)
        static let ratingAndVotesValues = UIFont(name: "Helvetica", size: 12)
    }
    
    enum AccessibilityIdentifiers {
        static let song = "TabFInderTableViewCellSongLabel"
        static let artist = "TabFInderTableViewCellArtistLabel"
        static let rating = "TabFInderTableViewCellRatingLabel"
        static let votes = "TabFInderTableViewCellVotesLabel"
    }
}
