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
        WebScrapingManager.shared.getResultsFromTitleSearch(titleName: titleName) { songList in
            self.songs.value = songList
//            for song in songList {
//                print("Artist: \(song.artist) | Song: \(song.song) | Votes: \(song.votes) | Rating: \(song.rating)")
//                print("tab URL: \(song.tabUrl)\n")
//            }
        }
    }
}

