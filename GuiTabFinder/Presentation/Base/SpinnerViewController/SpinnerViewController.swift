//
//  SpinnerViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import UIKit

// MARK: SpinnerViewController

final class SpinnerViewController: UIViewController {
    
    private (set) var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        spinner.startAnimating()
        return spinner
    }()
    
    override func loadView() {
        setupView()
    }
}

// MARK: Setup View

extension SpinnerViewController {
    
    private func setupView() {
        setupBackgroundView()
        setupSpinnerView()
    }
    
    private func setupBackgroundView() {
        view = UIView()
        view.backgroundColor = Colors.background
    }
    
    private func setupSpinnerView() {
        view.addSubview(spinner)
        setupSpinnerViewConstraints()
    }
}
