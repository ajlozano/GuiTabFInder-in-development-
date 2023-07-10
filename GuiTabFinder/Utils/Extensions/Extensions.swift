//
//  ActivityIndicatorExtension.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 12/4/23.
//

import UIKit

extension UIActivityIndicatorView {
    func setupActivityIndicator(tableView: UITableView, navController: UINavigationController) -> UIView {
        let loadingView = UIView()
        let loadingLabel = UILabel()
        
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (tableView.frame.width / 2) - (width / 2)
        let y = (tableView.frame.height / 2) - (height / 2) - (navController.navigationBar.frame.height)
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        loadingView.isHidden = true

        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)

        // Sets spinner
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.style = .large
        self.color = .red

        loadingView.addSubview(self)
        loadingView.addSubview(loadingLabel)
        
        return loadingView
    }
}
