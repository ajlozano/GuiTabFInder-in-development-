//
//  TunerViewController+SwiftUIView.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import Foundation
import SwiftUI
import AudioKit
import AudioKitEX
import AudioKitUI
import AudioToolbox
import SoundpipeAudioKit

// MARK: TunerViewController - SwiftUI View

struct TunerConductorView: View {
    @ObservedObject var viewModel = DefaultTunerViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("Frequency")
                Spacer()
                Text("\(viewModel.data.pitch, specifier: "%0.1f")")
            }.padding()
            
            HStack {
                Text("Amplitude")
                Spacer()
                Text("\(viewModel.data.amplitude, specifier: "%0.1f")")
            }.padding()
            
            HStack {
                Text("Note Name")
                Spacer()
                Text("\(viewModel.data.noteNameWithSharps) / \(viewModel.data.noteNameWithFlats)")
            }.padding()
            
            InputDevicePicker(device: viewModel.service.initialDevice)
        }
        //.cookbookNavBarTitle("Tuner")
        .onAppear {
            viewModel.service.startAudioEngine(state: true)
        }
        .onDisappear {
            viewModel.service.startAudioEngine(state: false)
        }
    }
}

struct InputDevicePicker: View {
    @State var device: Device
    
    var body: some View {
        Picker("Input: \(device.deviceID)", selection: $device) {
            ForEach(getDevices(), id: \.self) {
                Text($0.deviceID)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: device, perform: setInputDevice)
    }
    
    func getDevices() -> [Device] {
        AudioEngine.inputDevices.compactMap { $0 }
    }
    
    func setInputDevice(to device: Device) {
        do {
            try AudioEngine.setInputDevice(device)
        } catch let err {
            print(err)
        }
    }
}


