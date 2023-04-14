//
//  MainViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 5/4/23.
//

import Foundation

final class MainViewModel {
    
    var songs: ObservableObject<[SongDetails]?> = ObservableObject(nil)
 
    func fetchData(titleName: String) {
        WebScrapingManager.shared.getSearchResultsFromHtml(titleName: titleName) { songList in
            self.songs.value = songList
        }
    }
}

