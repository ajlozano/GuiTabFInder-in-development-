//
//  TunerViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import Foundation

// MARK: DefaultTunerViewModel - class

final class DefaultTunerViewModel: ObservableObject {
    
    @Published var data = TunerData()
    
   // var service: AudioTuningService
    
//    init(service: AudioTuningService = DefaultAudioTuningService()) {
//        self.service = service
//        getTunerData()
//    }
    
    init() {
        
    }
    
//    func getTunerData() {
//        service.getPitch { result in
//            switch (result) {
//            case .success(let data):
//                self.data = data
//            case .failure(_):
//                break
//            }
//        }
//    }
}

