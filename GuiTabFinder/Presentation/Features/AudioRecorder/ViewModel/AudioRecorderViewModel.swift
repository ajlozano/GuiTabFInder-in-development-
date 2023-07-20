//
//  AudioRecorderViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import Foundation

// MARK: DefaultAudioRecorderViewModel - class

final class DefaultAudioRecorderViewModel: ObservableObject {
    
    var service: AudioRecorderService
    
    @Published var isPlaying: Bool {
        didSet {
            if isPlaying {
                service.startPlaying(action: true)
            } else {
                service.startPlaying(action: false)
            }
        }
    }
    
    @Published var isRecording: Bool {
        didSet {
            if isRecording {
                service.startRecording(action: true)
            } else {
                service.startRecording(action: false)
            }
        }
    }
    
    init(service: AudioRecorderService = DefaultAudioRecorderService()) {
        self.service = service
        isRecording = false
        isPlaying = false
    }
}
