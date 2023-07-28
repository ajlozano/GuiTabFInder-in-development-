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
    @Published var needleRotation: Double = 0.0
    @Published var nextNote: String = ""
    @Published var previousNote: String = ""
    
    var service: AudioTuningService
    
    init(service: AudioTuningService = DefaultAudioTuningService()) {
        self.service = service
        getTunerData()
    }
}

// MARK: DefaultTunerViewModel - Private methods

extension DefaultTunerViewModel {
    private func getTunerData() {
        service.getPitch { result in
            switch (result) {
            case .success(let data):
                self.data = data
                self.getNeedleRotationValue()
                self.getNextNote()
                self.getPreviousNote()
            case .failure(_):
                break
            }
        }
    }
    
    private func getNeedleRotationValue() {

        let currentIndex = data.fromIndex
        let currentFreqNote = service.noteFrequencies[currentIndex]
        
        if (data.freqInNoteScale < currentFreqNote) {
            let calc = 1 - (currentFreqNote - data.freqInNoteScale)
            needleRotation = Double(-90 + (calc * 90))
            if (needleRotation < -90) {
                needleRotation = -90
            }
        } else {
            let calc = data.freqInNoteScale - currentFreqNote
            needleRotation = Double(calc * 90)
            if (needleRotation > 90) {
                needleRotation = 90
            }
        }
    }

    private func getNextNote() {
        nextNote = data.fromIndex == (service.noteNamesWithSharps.count - 1) ?
            service.noteNamesWithSharps[0] : service.noteNamesWithSharps[data.fromIndex + 1]

    }
    
    private func getPreviousNote() {
        previousNote = data.fromIndex == 0 ?
        service.noteNamesWithSharps[service.noteNamesWithSharps.count - 1] : service.noteNamesWithSharps[data.fromIndex - 1]

    }
}


