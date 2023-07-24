//
//  AudioRecorderViewController+SwiftUIView.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import AudioKit
import AudioKitEX
import AudioKitUI
import AVFoundation
import SwiftUI

// MARK: Recorder Conductor View

struct RecorderConductorView: View {
    @ObservedObject var viewModel = DefaultAudioRecorderViewModel()

    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.isRecording ? "STOP RECORDING" : "RECORD")
                .foregroundColor(.blue)
                .onTapGesture {
                viewModel.isRecording.toggle()
            }
            Spacer()
            Text(viewModel.isPlaying ? "STOP" : "PLAY")
                .foregroundColor(.blue)
                .onTapGesture {
                viewModel.isPlaying.toggle()
            }
            Spacer()
        }

        .padding()
        //.cookbookNavBarTitle("Recorder")
        .onAppear {
            viewModel.service.startAudioEngine(state: true)
        }
        .onDisappear {
            viewModel.service.startAudioEngine(state: false)
        }
    }
}

