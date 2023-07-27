//
//  TunerViewController+SwiftUIView.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import SwiftUI
import AudioKit
import AudioKitEX
import AudioKitUI
import AudioToolbox
import SoundpipeAudioKit

// MARK: Tuner Conductor View

struct TunerConductorView: View {
    @ObservedObject var viewModel = DefaultTunerViewModel()

    // TODO: Delete hardcoding and use enums and constants
    // TODO: Add next and previous notes in view
    // TODO: Improve design?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .black, .gray]), startPoint: .top, endPoint: .bottom)
            
            // Matched Note
            VStack{
                HStack{
                    //Text("Note Name")
                    //    .foregroundColor(.white)
                    Text("\(viewModel.data.noteNameWithSharps)")
                        .foregroundColor(getNeedleColor())
                        .font(.system(size: 100, design: .rounded))
                    Text("\(viewModel.data.octave)")
                        .foregroundColor(getNeedleColor())
                        .font(.system(size: 50, design: .rounded))
                }
            }.offset(x: 0, y: -250)

            // Markers
            ForEach(0..<25) { index in
                Rectangle()
                    .frame(width: 2, height: tickSize(forIndex: index).height)
                    .cornerRadius(1)
                    .offset(x:0, y: -170)
                    .foregroundColor(TunerColors.markers)
                    .fixedSize(horizontal: false, vertical: true)
                    .rotationEffect(.degrees(getMarkerDegree(from: index)), anchor: .center)
            }
            
            // Needle
            Rectangle()
                .frame(width: 6, height: 180)
                .cornerRadius(3)
                .offset(x: 0, y: -80)
                .foregroundColor(getNeedleColor())
                .alignmentGuide(HorizontalAlignment.center) { dimensions in
                    dimensions[HorizontalAlignment.center]
                }
                .rotationEffect(.degrees(viewModel.needleRotation), anchor: .center)
                .animation(.easeInOut(duration: 0.4), value: viewModel.needleRotation)
            
            // Circle Object
            Circle()
                .trim(from: 0, to: 0.5)
                .rotationEffect(.degrees(180))
                .foregroundColor(TunerColors.markers)
                .frame(width: 40, height: 40)
                .offset(x:0, y: 10)
            
            // Circle Object inside
            Circle()
                .trim(from: 0, to: 0.5)
                .rotationEffect(.degrees(180))
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
                .offset(x:0, y: 10)
            
            // Rectangle base object
            Rectangle()
                .frame(width: 300, height: 1)
                .cornerRadius(1)
                .offset(x: 0, y: 10)
                .foregroundColor(TunerColors.markers)
                .alignmentGuide(HorizontalAlignment.center) { dimensions in
                    dimensions[HorizontalAlignment.center]
                }
            
            // Frequency text
            HStack{
                Text("\(viewModel.data.pitch, specifier: "%0.1f")Hz")
                    .foregroundColor(.white)
            }.offset(x: 0, y: 30)

            Image("GuitarHeadstock")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
                .offset(x: 0, y: 260)
        }
        .onAppear {
            viewModel.service.startAudioEngine(state: true)
        }
        .onDisappear {
            viewModel.service.startAudioEngine(state: false)
        }
    }
}

// MARK: TunerConductorView - private methods

extension TunerConductorView {
    
    private func tickSize(forIndex index: Int) -> NoteTickSize {
        if index == 12 {
            return .large
        } else if [2, 7, 17, 22].contains(index) {
            return .medium
        } else {
            return .small
        }
    }
    
    private func getMarkerDegree(from index: Int) -> Double {
        return (-90.0 + (7.5 * Double(index)))
    }
    
    private func getNeedleColor() -> Color {
        let absDegree = fabsl(viewModel.needleRotation)
        
        if (absDegree < 20) {
            return ColorNoteMatched.matched.color
        } else if (absDegree < 40) {
            return ColorNoteMatched.close.color
        }
        return ColorNoteMatched.far.color
    }
}

// MARK: Input device picker

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

struct TunerConductorView_Previews: PreviewProvider {
    static var previews: some View {
        TunerConductorView()
    }
}




