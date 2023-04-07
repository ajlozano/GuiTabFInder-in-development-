//
//  ViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 4/4/23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let mainViewModel = MainViewModel()
    var songs = [SongDetails]()
    
    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mainViewModel.fetchData(titleName: "In Flames")
        setupBinders()
    }
    
    private func setupBinders() {
        mainViewModel.songs.bind { songs in
            if let songList = songs {
                for song in songList {
                    self.songs.append(song)
                }
                self.reloadTableViewData()
            }
        }
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MainTableViewCell
        
        cell.setup(song: self.songs[indexPath.row].song,
                   artist: self.songs[indexPath.row].artist,
                   rating: self.songs[indexPath.row].rating,
                   votes: self.songs[indexPath.row].votes)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - Search Bar delegate methods

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text?.count == 0) {
            songs = []
            reloadTableViewData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        songs = []
        if let text = searchBar.text {
            turnActivityIndicator(state: true)
            mainViewModel.fetchData(titleName: text)
        }
    }
}

// MARK: - Activity indicator methods

extension MainTableViewController {
    func setupActivityIndicator() {
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (tableView.frame.width / 2) - (width / 2)
        let y = (tableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        loadingView.isHidden = true
        
        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)

        // Sets spinner
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.style = .large
        spinner.color = .white

        loadingView.addSubview(spinner)
        loadingView.addSubview(loadingLabel)
        
        self.tableView.addSubview(loadingView)
    }
    
    func turnActivityIndicator(state: Bool) {
        DispatchQueue.main.async {
            if (state) {
                self.loadingView.isHidden = false
                self.loadingLabel.isHidden = false
                self.spinner.startAnimating()
            } else {
                self.spinner.stopAnimating()
                self.loadingLabel.isHidden = true
                self.loadingView.isHidden = true
            }
        }
    }
}
