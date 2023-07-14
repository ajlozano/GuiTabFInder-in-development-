//
//  BaseViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import UIKit

// MARK: RMBaseViewController

class BaseViewController: UIViewController {
    
    let child = SpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: RMBaseViewController - Mannage Spinner

extension BaseViewController {
    
    func showSpinner() {
        DispatchQueue.main.async {
            self.addChild(self.child)
            self.child.view.frame = self.view.frame
            self.view.addSubview(self.child.view)
            self.child.didMove(toParent: self)
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.child.willMove(toParent: nil)
            self.child.view.removeFromSuperview()
            self.child.removeFromParent()
        }
    }
}
