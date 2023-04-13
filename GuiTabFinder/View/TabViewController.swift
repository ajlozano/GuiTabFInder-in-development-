//
//  TabViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/4/23.
//

import UIKit

class TabViewController: UIViewController {
    
    @IBOutlet weak var tuningTitleLabel: UILabel!
    @IBOutlet weak var tabTextView: UITextView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var tuningLabel: UILabel!
    
    let tabViewModel = TabViewModel()
    
    var song: SongDetails? {
        didSet {
            print("Song did Set: \(song?.songName)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabTextView.font = UIFont.monospacedSystemFont(ofSize: 7, weight: .semibold)
        tabTextView.adjustsFontForContentSizeCategory = true
 
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
