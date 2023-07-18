//
//  TablatureDetailViewController+ScrollViewDelegate.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 12/7/23.
//

import UIKit

// MARK: TablatureDetailViewController - ScrollViewDelegate

extension TablatureDetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.tabTextView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let textViewSize = tabTextView.frame.size
        let scrollViewSize = scrollView.bounds.size

        let verticalPadding = textViewSize.height < scrollViewSize.height ? (scrollViewSize.height - textViewSize.height) / 2 : 0
        let horizontalPadding = textViewSize.width < scrollViewSize.width ? (scrollViewSize.width - textViewSize.width) / 2 : 0

        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
}
