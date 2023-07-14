//
//  TablatureDetailViewController+Constants.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 13/7/23.
//

import UIKit

// MARK: - Constants
 
extension TablatureDetailViewController {
    enum Fonts {
        static let artist = UIFont(name: "Helvetica-Bold", size: 12)
        static let tuning = UIFont(name: "Helvetica-Bold", size: 12)
        static let emptyStateMessage = UIFont(name: "Helvetica-Light", size: 20)
    }
    
    enum AccessibilityIdentifiers {
        static let artist = "TabDetailArtistLabel"
        static let tuning = "TabDetailTuningLabel"
        static let tab = "TabDetailTabTextView"
    }
    
    enum Constants {
        static let emptyStateMessage = "There's nothing here"
    }
}
