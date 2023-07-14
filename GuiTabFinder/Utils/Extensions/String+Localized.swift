//
//  String+Localized.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 12/7/23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
