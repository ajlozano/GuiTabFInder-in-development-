//
//  TunerViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 18/7/23.
//

import UIKit
import SwiftUI

class TunerViewController: BaseViewController {
    
    var coordinator: TunerCoordinator?
    var viewModel: TunerViewModel
    
    var tunerSwiftUIView: UIView = {
        let swiftUIHostingController = UIHostingController(rootView: TunerSwiftUIView())
        let view = swiftUIHostingController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: TunerViewModel = DefaultTunerViewModel()) {
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

// MARK: Setup View

extension TunerViewController {

    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(tunerSwiftUIView)
        tunerSwiftUIView.backgroundColor = .brown
        setupTunerViewConstraints()
    }
}
