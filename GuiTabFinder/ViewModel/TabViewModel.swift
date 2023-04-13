//
//  TabViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/4/23.
//

import Foundation

final class TabViewModel {
    var selectedSong: ObservableObject<SongDetails?> = ObservableObject(nil)

    func getTabFromUrl(song: SongDetails) {
        print(song.artist)
        WebScrapingManager.shared.getTabFromUrl(url: song.tabUrl) { [weak self] tabString, tuningString in
            var scrapingSong = song
            scrapingSong.tab = tabString
            scrapingSong.tabTuning = tuningString
            
            self?.selectedSong.value = scrapingSong
        }
    }
}
