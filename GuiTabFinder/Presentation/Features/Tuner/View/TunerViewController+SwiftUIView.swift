//
//  TunerViewController+SwiftUIView.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import SwiftUI

// MARK: TunerViewController - SwiftUI View

extension TunerViewController {
    
    struct TunerSwiftUIView: View {
        var body: some View {
            ZStack {
                Color.red
                Button("Hello, SwiftUI!") {
                    
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
    }
}
