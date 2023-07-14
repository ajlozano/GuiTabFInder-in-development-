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
}
