//
//  TablatureFinderViewController+SearchBarDelegate.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import UIKit

extension TablatureFinderViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text?.count == 0) {
            viewModel.clearList()
            reloadView()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            turnActivityIndicator(state: true)
            viewModel.clearList()
            viewModel.fetchData(text: text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.clearList()
        reloadView()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
