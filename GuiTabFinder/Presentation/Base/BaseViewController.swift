//
//  BaseViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 14/7/23.
//

import UIKit

// MARK: BaseViewController

class BaseViewController: UIViewController {
    
    let child = SpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Mannage Spinner

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

// MARK: Alert Error

extension BaseViewController {
    func showErrorAlert(with title: String, message: String) {
        DispatchQueue.main.async {
            let alertCtrl = UIAlertController(title: "Error during the process", message: "An unexpected error has occurred", preferredStyle: .alert)
            alertCtrl.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alertCtrl, animated: true, completion: nil)
        }
        
    }
}
