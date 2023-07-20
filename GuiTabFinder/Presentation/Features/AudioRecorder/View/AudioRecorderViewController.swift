//
//  AudioRecorderViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit
import SwiftUI

class AudioRecorderViewController: BaseViewController {
    
    var coordinator: AudioRecorderCoordinator?
    
    var recorderConductorView: UIView = {
        let swiftUIHostingController = UIHostingController(rootView: RecorderConductorView())
        let view = swiftUIHostingController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: Setup view

extension AudioRecorderViewController {
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(recorderConductorView)
        recorderConductorView.backgroundColor = .green
        setupAudioRecorderViewConstraints()
    }
}
