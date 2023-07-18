//
//  AudioRecorderViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit

class AudioRecorderViewController: BaseViewController {
    
    var coordinator: AudioRecorderCoordinator?
    var viewModel: AudioRecorderViewModel
    
    init(viewModel: AudioRecorderViewModel = DefaultAudioRecorderViewModel()) {
        self.viewModel = viewModel
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
    }
}
