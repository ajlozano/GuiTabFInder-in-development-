//
//  AudioRecorderService.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 20/7/23.
//

import AudioKit
import AudioKitEX
import AudioKitUI
import AVFoundation

// MARK: AudioRecorderService - protocols

protocol AudioRecorderService: AudioRecorderServiceInput, AudioRecorderServiceOutput {}

protocol AudioRecorderServiceOutput {}

protocol AudioRecorderServiceInput {
    func startAudioEngine(state: Bool)
    func startRecording(action: Bool)
    func startPlaying(action: Bool)
}

// MARK: AudioRecorderService - class

class DefaultAudioRecorderService: ObservableObject, HasAudioEngine, AudioRecorderService {

    let engine = AudioEngine()
    var recorder: NodeRecorder?
    let player = AudioPlayer()
    var silencer: Fader?
    let mixer = Mixer()

    init() {
        guard let input = engine.input else {
            fatalError()
        }

        do {
            recorder = try NodeRecorder(node: input)
        } catch let err {
            fatalError("\(err)")
        }
        let silencer = Fader(input, gain: 0)
        self.silencer = silencer
        mixer.addInput(silencer)
        mixer.addInput(player)
        engine.output = mixer
    }
}

// MARK: AudioRecorderService - Input methods

extension DefaultAudioRecorderService {
    func startAudioEngine(state: Bool) {
        if (state) { self.start() }
        else { self.stop() }
    }
    
    func startRecording(action: Bool) {
        if (action) {
            do {
                try recorder?.record()
            } catch let err {
                print(err)
            }
        } else {
            recorder?.stop()
        }
    }
    
    func startPlaying(action: Bool) {
        if (action) {
            if let file = recorder?.audioFile {
                player.file = file
                player.play()
            }
        } else {
            player.stop()
        }
    }
}
