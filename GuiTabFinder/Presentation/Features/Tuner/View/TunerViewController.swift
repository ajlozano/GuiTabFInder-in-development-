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
    
    var tunerConductorView: UIView = {
        let swiftUIHostingController = UIHostingController(rootView: TunerConductorView(viewModel: DefaultTunerViewModel()))
        let view = swiftUIHostingController.view!
        //let view = UIView(frame: .zero)
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

// MARK: Setup View

extension TunerViewController {

    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(tunerConductorView)

        tunerConductorView.backgroundColor = .brown
        setupTunerViewConstraints()
    }
}
