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
    var loadingStatus: ObservableObject<LoadingStatus?> { get }
    var model: ObservableObject<TablatureListModel?> { get }
    var tablatureDetailModel: ObservableObject<TablatureDetail?> { get }
    var showEmptyStateError: ObservableObject<Bool?> { get }
}

// MARK: DefaultTablatureFinderViewModel

final class DefaultTablatureFinderViewModel: TablatureFinderViewModel {
    var loadingStatus: ObservableObject<LoadingStatus?> = ObservableObject(nil)
    var model: ObservableObject<TablatureListModel?> = ObservableObject(nil)
    var tablatureDetailModel: ObservableObject<TablatureDetail?> = ObservableObject(nil)
    var showEmptyStateError: ObservableObject<Bool?> = ObservableObject(nil)
}

// MARK: Input methods

extension DefaultTablatureFinderViewModel {
    func fetchNewTablatures() {
        
    }
    
    func selectCell(atIndex index: Int) {
        tablatureDetailModel.value = model.value?.tablatures?[index]
    }
    
    func clearList() {
        self.model.value = nil
        self.tablatureDetailModel.value = nil
        self.showEmptyStateError.value = false
    }
}

// MARK: Fetch data methods

extension DefaultTablatureFinderViewModel {
    func fetchData(text: String) {
        
        loadingStatus.value = .start
        WebScrapingManager.shared.getSearchResultsFromHtml(text: text) { [weak self] result in
            switch result {
            case .success(let tablatureList):
                self?.loadingStatus.value = .stop
                self?.model.value = tablatureList
                self?.showEmptyStateError.value = false
            case .failure(_):
                self?.loadingStatus.value = .stop
                self?.model.value = TablatureListModel(tablatures: [], isFetchDataFinished: true)
                self?.showEmptyStateError.value = true
            }
        }
    }
}

