//
//  TablatureDetailViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 12/7/23.
//

import Foundation

// MARK: TablatureFinderViewModel

protocol TablatureDetailViewModel: TablatureDetailViewModelInput, TablatureDetailViewModelOutput {}

protocol TablatureDetailViewModelInput {
    func viewDidLoad(for tablatureDetail: TablatureDetail)
    func fetchData(tablatureDetail: TablatureDetail)
}

protocol TablatureDetailViewModelOutput {
    var loadingStatus: ObservableObject<LoadingStatus?> { get }
    var tablatureDetailModel: ObservableObject<TablatureDetail?> { get }
    var showEmptyStateError: ObservableObject<Bool?> { get }
}

// MARK: DefaultTablatureDetailViewModel

final class DefaultTablatureDetailViewModel: TablatureDetailViewModel {
    var loadingStatus: ObservableObject<LoadingStatus?> = ObservableObject(nil)
    var inputModel: TablatureDetail?
    var tablatureDetailModel: ObservableObject<TablatureDetail?> = ObservableObject(nil)
    var showEmptyStateError: ObservableObject<Bool?> = ObservableObject(nil)
}

// MARK: Input methods

extension DefaultTablatureDetailViewModel {
    func viewDidLoad(for tablatureDetail: TablatureDetail) {
        self.inputModel = tablatureDetail
        fetchData(tablatureDetail: tablatureDetail)
    }
}

// MARK: Fetch data methods

extension DefaultTablatureDetailViewModel {
    func fetchData(tablatureDetail: TablatureDetail) {
        loadingStatus.value = .start
        WebScrapingManager.shared.getTabFromHtml(url: tablatureDetail.tabUrl, completion: { [weak self] tablature, tuning in
            guard let tab = tablature else {
                self?.loadingStatus.value = .stop
                self?.inputModel?.tab = nil
                self?.inputModel?.tabTuning = nil
                self?.tablatureDetailModel.value = nil
                self?.showEmptyStateError.value = true
                
                return
            }

            self?.loadingStatus.value = .stop
            self?.inputModel?.tab = tab
            self?.inputModel?.tabTuning = tuning
            self?.tablatureDetailModel.value = self?.inputModel
            self?.showEmptyStateError.value = false
        })
    }
}
