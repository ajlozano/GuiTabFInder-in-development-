//
//  TabViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/4/23.
//

import Foundation

final class TabViewModel {
    var selectedSong: ObservableObject<TablatureDetails?> = ObservableObject(nil)

    func getTabFromUrl(song: TablatureDetails) {
        print(song.artist)
        WebScrapingManager.shared.getTabFromHtml(url: song.tabUrl) { [weak self] tabString, tuningString in
            var scrapingSong = song
            scrapingSong.tab = tabString
            scrapingSong.tabTuning = tuningString
            
            self?.selectedSong.value = scrapingSong
        }
    }
}
