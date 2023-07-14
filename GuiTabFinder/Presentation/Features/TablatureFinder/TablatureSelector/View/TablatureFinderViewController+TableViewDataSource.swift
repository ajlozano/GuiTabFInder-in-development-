//
//  TablatureFinderViewController+TableViewDataSource.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

// MARK: TablatureFinderTableViewController -  CellIdentifiers

extension TablatureFinderTableViewDataSource {
    enum CellIdentifiers {
        static let tablatureTableViewCell = "TablatureTableViewCell"
        static let loadingTableViewCell = "LoadingTableViewCell"
    }
}

// MARK: TablatureFinderTableViewController - TableViewDataSource

final class TablatureFinderTableViewDataSource: NSObject, UITableViewDataSource {
    
    var tableView: UITableView
    var viewModel: TablatureFinderViewModel
    
    init(tableView: UITableView, viewModel: TablatureFinderViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableView.register(TablatureFinderTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.tablatureTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tablaturesCount = self.viewModel.model.value?.tablatures?.count else { return 0 }
        
        return tablaturesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tablature = self.viewModel.model.value?.tablatures?[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.tablatureTableViewCell, for: indexPath) as? TablatureFinderTableViewCell {
            
            cell.selectionStyle = .none
            cell.configure(withSong: tablature.songName,
                           withArtist: tablature.artist,
                           withRating: tablature.rating,
                           withVotes: tablature.votes)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
