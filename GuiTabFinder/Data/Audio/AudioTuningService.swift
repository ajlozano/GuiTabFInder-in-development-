//
//  audioTuningManager.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 20/7/23.
//

import AudioKit
import AudioKitEX
import AudioKitUI
import AudioToolbox
import SoundpipeAudioKit

// MARK: TunerData

struct TunerData {
    var pitch: Float = 0.0
    var amplitude: Float = 0.0
    var noteNameWithSharps = "-"
    var noteNameWithFlats = "-"
}

// MARK: AudioTuningService - protocols

protocol AudioTuningService: AudioTuningServiceInput, AudioTuningServiceOutput {}

protocol AudioTuningServiceInput {
    func startAudioEngine(state: Bool)
    func getPitch(completion: @escaping (Result<TunerData, AppError>) -> Void)
}

protocol AudioTuningServiceOutput {
    var initialDevice: Device { get }
}

// MARK: DefaultAudioTuningService - class

class DefaultAudioTuningService: AudioTuningService, HasAudioEngine {
    
    var data = TunerData()
    
    let engine = AudioEngine()
    let initialDevice: Device
    
    let mic: AudioEngine.InputNode
    let tappableNodeA: Fader
    let tappableNodeB: Fader
    let tappableNodeC: Fader
    let silence: Fader
    
    var tracker: PitchTap!
    
    let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
    let noteNamesWithSharps = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
    let noteNamesWithFlats = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
    
    init() {
        
        guard let input = engine.input else { fatalError() }
        
        guard let device = engine.inputDevice else { fatalError() }
        
        initialDevice = device
        
        mic = input
        tappableNodeA = Fader(mic)
        tappableNodeB = Fader(tappableNodeA)
        tappableNodeC = Fader(tappableNodeB)
        silence = Fader(tappableNodeC, gain: 0)
        engine.output = silence
    }
}

// MARK: DefaultAudioTuningService - Input methods

extension DefaultAudioTuningService {
    func getPitch(completion: @escaping (Result<TunerData, AppError>) -> Void) {
        tracker = PitchTap(mic) { pitch, amp in
            DispatchQueue.main.async {
                if (self.update(pitch[0], amp[0])) { completion(.success(self.data)) }
                else { completion(.failure(AppError.inputNoise)) }
            }
        }
        tracker.start()
    }
    
    func update(_ pitch: AUValue, _ amp: AUValue) -> Bool {
        // Reduces sensitivity to background noise to prevent random / fluctuating data.
        guard amp > 0.1 else { return false }
        
        data.pitch = pitch
        data.amplitude = amp
        
        var frequency = pitch
        while frequency > Float(noteFrequencies[noteFrequencies.count - 1]) {
            frequency /= 2.0
        }
        while frequency < Float(noteFrequencies[0]) {
            frequency *= 2.0
        }
        
        var minDistance: Float = 10000.0
        var index = 0
        
        for possibleIndex in 0 ..< noteFrequencies.count {
            let distance = fabsf(Float(noteFrequencies[possibleIndex]) - frequency)
            if distance < minDistance {
                index = possibleIndex
                minDistance = distance
            }
        }
        let octave = Int(log2f(pitch / frequency))
        data.noteNameWithSharps = "\(noteNamesWithSharps[index])\(octave)"
        data.noteNameWithFlats = "\(noteNamesWithFlats[index])\(octave)"
        
        return true
    }
    
    func startAudioEngine(state: Bool) {
        if (state) { self.start() }
        else { self.stop() }
    }
}
