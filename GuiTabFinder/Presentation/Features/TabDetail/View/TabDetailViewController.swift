//
//  TabViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/4/23.
//

import UIKit

class TabDetailViewController: UIViewController {
    
    @IBOutlet weak var tabScrollView: UIScrollView!
    @IBOutlet weak var tuningTitleLabel: UILabel!
    @IBOutlet weak var tabTextView: UITextView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var tuningLabel: UILabel!
    
    let tabViewModel = TabViewModel()
    
    var song: TablatureDetails? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabTextView.font = UIFont.monospacedSystemFont(ofSize: 7, weight: .semibold)
        tabTextView.adjustsFontForContentSizeCategory = true
        
        tabScrollView.minimumZoomScale = 1.0
        tabScrollView.maximumZoomScale = 3.0
        
        tabScrollView.delegate = self
 
        setupBinders()
        
        if let songDetails = song {
            tabViewModel.getTabFromUrl(song: songDetails)
        }
    }

    private func setupBinders() {
        self.tabViewModel.selectedSong.bind { song in
            // song instance updated with tab details
            if let songDetails = song {
                self.song = songDetails
                self.updateViewValues()
            }
        }
    }
    
    private func updateViewValues() {
        DispatchQueue.main.async {
            self.songLabel.text = self.song!.songName
            self.artistLabel.text = self.song!.artist
            if (self.song?.tabTuning == nil) {
                self.tuningTitleLabel.isHidden = true
            }
            self.tuningLabel.text = self.song!.tabTuning
            self.tabTextView.text = self.song!.tab
        }
    }
}

// MARK: UIScrollViewDelegate methods

extension TabDetailViewController: UIScrollViewDelegate {
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
