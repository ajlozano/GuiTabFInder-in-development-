//
//  TablatureFinderViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import Foundation

// MARK: TablatureFinderViewModelDelegate

protocol TablatureFinderViewModelDelegate: AnyObject {
    func didLoadInitialTablatures()
    func didLoadMoreTablatures(with newIndexPaths: [IndexPath])
}

// MARK: TablatureFinderViewModel - protocols

protocol TablatureFinderViewModel: TablatureFinderViewModelInput, TablatureFinderViewModelOutput {}

protocol TablatureFinderViewModelInput {
    func fetchNewTablatures()
    func fetchData(text: String)
    func selectCell(atIndex index: Int)
    func clearList()
}

protocol TablatureFinderViewModelOutput {
    var loadingStatus: ObservableObject<LoadingStatus?> { get }
    var model: TablatureListModel? { get }
    var tablatureDetailModel: ObservableObject<TablatureDetail?> { get }
    var showEmptyStateError: ObservableObject<Bool?> { get }
    var delegate: TablatureFinderViewModelDelegate? { get set }
}

// MARK: DefaultTablatureFinderViewModel - class

final class DefaultTablatureFinderViewModel: TablatureFinderViewModel {
    var delegate: TablatureFinderViewModelDelegate?
    var loadingStatus: ObservableObject<LoadingStatus?> = ObservableObject(nil)
    var model: TablatureListModel?
    var tablatureDetailModel: ObservableObject<TablatureDetail?> = ObservableObject(nil)
    var showEmptyStateError: ObservableObject<Bool?> = ObservableObject(nil)
    var tablatureListUseCase: TablatureListUseCase
    var pageNumber: Int = 1
    var searchText: String = ""
    
    init(tablatureListUseCase: TablatureListUseCase = DefaultTablatureListUseCase()) {
        self.tablatureListUseCase = tablatureListUseCase
    }
}

// MARK: Input methods

extension DefaultTablatureFinderViewModel {
    func fetchNewTablatures() {
        if (!self.model!.didAllTablaturesFetched) {
            self.model!.page! += 1
            fetchData(text: searchText)
        }
    }
    
    func selectCell(atIndex index: Int) {
        tablatureDetailModel.value = model?.tablatures?[index]
    }
    
    func clearList() {
        self.model = nil
        self.tablatureDetailModel.value = nil
        self.showEmptyStateError.value = false
    }
}

// MARK: Fetch data methods

extension DefaultTablatureFinderViewModel {
    func fetchData(text: String) {
        
        loadingStatus.value = .start

        searchText = text
        
        let page = model?.page ?? 1
        
        let useCaseParameters = TablatureListRepositoryParameters(page: "\(page)", searchText: text)
        
        tablatureListUseCase.execute(params: useCaseParameters) { [weak self] result in
            
            switch result {
            case .success(let tablatureList):
                self?.loadingStatus.value = .stop
                if (self?.model == nil) {
                    self?.model = tablatureList
                    self?.delegate?.didLoadInitialTablatures()
                } else {
                    // Add additional index paths fetched to tablatures array
                    guard let newCount = tablatureList.tablatures?.count else { return }
                    guard let initialCount = self?.model?.tablatures?.count else { return }
                    let totalCount = initialCount + newCount
                    let startingUpdateIndex = totalCount - newCount
                    let indexPathsToAdd: [IndexPath] = Array(startingUpdateIndex..<(startingUpdateIndex+newCount)).compactMap { row in
                        return IndexPath(row: row, section: 0)
                    }
    
                    self?.model?.tablatures?.append(contentsOf: tablatureList.tablatures!)
                    self?.delegate?.didLoadMoreTablatures(with: indexPathsToAdd)
                }
                
                self?.showEmptyStateError.value = false
            case .failure(_):
                self?.loadingStatus.value = .stop
                if (self?.model == nil) {
                    self?.showEmptyStateError.value = true
                    return
                }

                self?.model?.didAllTablaturesFetched = true
            }
        }
    }
}

