//
//  Coordinator.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/4/23.
//

import Foundation


class Coordinator {
    static let shared = Coordinator()
    let mainViewModel = MainViewModel()
    let tabViewModel = TabViewModel()
    
    func sendToTabViewModel(data: SongDetails) {
        tabViewModel.selectedSong.value = data
        //print(tabViewModel.selectedSong.value)
    }
}
