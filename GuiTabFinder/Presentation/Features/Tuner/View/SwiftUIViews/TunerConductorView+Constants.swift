//
//  TunerConductorView+Constants.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 25/7/23.
//

import Foundation
import SwiftUI

extension TunerConductorView {
    enum TunerColors {
        static let markers: Color = .gray
    }
    
    // MARK: Note Matched color
    
    enum ColorNoteMatched {
        case far, close, matched
        
        var color: Color {
            switch self {
            case .far:
                return .red
            case .close:
                return .orange
            case .matched:
                return .green
            }
        }
    }
    
    // MARK: Note Tick Size

    enum NoteTickSize {
        case small, medium, large
        
        var height: CGFloat {
            switch self {
            case .small:
                return 20
            case .medium:
                return 40
            case .large:
                return 50
            }
        }
    }
}
