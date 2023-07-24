//
//  SettingsViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 21/7/23.
//

import Foundation

class SettingsViewController: BaseViewController {
    
    var coordinator: SettingsCoordinator?
    
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

extension SettingsViewController {
    private func setupView() {
        view.backgroundColor = .white
    
    }
}
