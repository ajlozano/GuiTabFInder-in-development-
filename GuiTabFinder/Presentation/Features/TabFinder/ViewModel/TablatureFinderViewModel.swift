//
//  TablatureFinderViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import Foundation

// MARK: TablatureFinderViewModel

protocol TablatureFinderViewModel: TablatureFinderViewModelInput, TablatureFinderViewModelOutput {}

protocol TablatureFinderViewModelInput {
    func fetchNewTablatures()
    func fetchData(text: String)
    func selectCell(atIndex index: Int)
    func clearList()
}

protocol TablatureFinderViewModelOutput {
    var model: ObservableObject<TablatureListModel?> { get }
    var tablatureDetailModel: ObservableObject<TablatureDetails?> { get }
}

// MARK: DefaultTablatureFinderViewModel

final class DefaultTablatureFinderViewModel: TablatureFinderViewModel {
    var model: ObservableObject<TablatureListModel?> = ObservableObject(nil)
    var tablatureDetailModel: ObservableObject<TablatureDetails?> = ObservableObject(nil)

    // TODO: Pending to inject use case dependency
    init() {
        
    }
}

// MARK: Input methods

extension DefaultTablatureFinderViewModel {
    func fetchNewTablatures() {
        
    }
    
    func selectCell(atIndex index: Int) {
        tablatureDetailModel.value = model.value?.tablatures?[index]
    }
    
    func clearList() {
        self.model = ObservableObject(nil)
        self.tablatureDetailModel = ObservableObject(nil)
    }
}

// MARK: Fetch data methods

extension DefaultTablatureFinderViewModel {
    func fetchData(text: String) {
        WebScrapingManager.shared.getSearchResultsFromHtml(text: text) { tablatureList in
            self.model.value = tablatureList
        }
    }
}
