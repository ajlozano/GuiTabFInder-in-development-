//
//  SongListModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import Foundation

struct TablatureListModel {
    var tablatures: [TablatureDetail]?
    var didAllTablaturesFetched: Bool
    var page: Int?
}
