//
//  NoteDistanceMarkers.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 24/7/23.
//

import SwiftUI

struct NoteDistanceMarkers: View {
    var body: some View {
        ZStack {
            Color(.black)
            Text("Hello world")
                .background(.blue)
                .foregroundColor(.white)
                .offset(x: 0, y: -180)
            Text("Hellold")
                .background(.blue)
                .foregroundColor(.white)
                .offset(x: 0, y: -220)
            
            Rectangle()
                .frame(width: 4, height: 120)
                .offset(x:0, y: -80)
                .foregroundColor(.red)
                .alignmentGuide(HorizontalAlignment.center) { dimensions in
                    dimensions[HorizontalAlignment.center]
                }
                .rotationEffect(Angle.degrees(37.5), anchor: .center)
            
            ForEach(0..<25) { index in
                
                Rectangle()
                    .frame(width: 1, height: tickSize(forIndex: index).height)
                    .cornerRadius(1)
                    .offset(x:0, y: -140)
                    .foregroundColor(.white)
                    .inExpandingRectangle()
                    .fixedSize(horizontal: false, vertical: true)
                    .rotationEffect(.degrees(getMarkerDegree(from: index)), anchor: .center)
            }
        }
    }

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
}

enum NoteTickSize {
    case small, medium, large

    var height: CGFloat {
        switch self {
        case .small:
            return 40
        case .medium:
            return 70
        case .large:
            return 100
        }
    }
}

extension View {
    func inExpandingRectangle() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
            self
        }
    }
}

struct NoteDistanceMarkers_Previews: PreviewProvider {
    static var previews: some View {
        NoteDistanceMarkers()
            .previewLayout(.sizeThatFits)
    }
}
