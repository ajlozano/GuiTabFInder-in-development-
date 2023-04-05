//
//  ViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 4/4/23.
//

import UIKit

class MainTableViewController: UITableViewController {

    let mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainViewModel.scrapeDataFromUrl(titleName: "Insomnium") { songsList in
            
        }
        
    }

    
}

