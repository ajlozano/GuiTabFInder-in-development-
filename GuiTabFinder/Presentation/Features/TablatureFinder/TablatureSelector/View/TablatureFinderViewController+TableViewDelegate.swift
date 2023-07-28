//
//  TablatureFinderViewController+TableViewDelegate.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

// MARK: TablatureFinderTableViewController - TableViewDelegate

final class TablatureFinderTableViewDelegate: NSObject, UITableViewDelegate {
    
    var viewModel: TablatureFinderViewModel
    
    init(viewModel: TablatureFinderViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCell(atIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let model = self.viewModel.model else { return }
//        
//        if (indexPath.row == (model.tablatures?.count)! - 1) {
//            self.viewModel.fetchNewTablatures()
//        }
    }
}
