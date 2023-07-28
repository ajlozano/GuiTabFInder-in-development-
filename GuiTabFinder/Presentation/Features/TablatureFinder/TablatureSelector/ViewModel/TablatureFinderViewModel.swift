//
//  TablatureFinderViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/7/23.
//

import Foundation

// MARK: TablatureFinderViewModelDelegate

//protocol TablatureFinderViewModelDelegate: AnyObject {
//    func didLoadInitialTablatures()
//    func didLoadMoreTablatures(with newIndexPaths: [IndexPath])
//}

// MARK: TablatureFinderViewModel - protocols

protocol TablatureFinderViewModel: TablatureFinderViewModelInput, TablatureFinderViewModelOutput {}

protocol TablatureFinderViewModelInput {
    //func fetchNewTablatures()
    func fetchTablatures(text: String)
    func selectCell(atIndex index: Int)
    func clearList()
}

protocol TablatureFinderViewModelOutput {
    var loadingStatus: Box<LoadingStatus?> { get }
    var model: Box<TablatureListModel?> { get }
    var tablatureDetailModel: Box<TablatureDetail?> { get }
    var showEmptyStateError: Box<Bool?> { get }
    //var delegate: TablatureFinderViewModelDelegate? { get set }
}

// MARK: DefaultTablatureFinderViewModel - class

final class DefaultTablatureFinderViewModel: TablatureFinderViewModel {
    //var delegate: TablatureFinderViewModelDelegate?
    var loadingStatus: Box<LoadingStatus?> = Box(nil)
    var model: Box<TablatureListModel?> = Box(nil)
    var tablatureDetailModel: Box<TablatureDetail?> = Box(nil)
    var showEmptyStateError: Box<Bool?> = Box(nil)
    var tablatureFinderUseCase: TablatureFinderUseCase
    var pageNumber: Int = 1
    var searchText: String = ""
    
    init(tablatureFinderUseCase: TablatureFinderUseCase = DefaultTablatureFinderUseCase()) {
        self.tablatureFinderUseCase = tablatureFinderUseCase
    }
}

// MARK: Input methods

extension DefaultTablatureFinderViewModel {
//    func fetchNewTablatures() {
//        if ((self.model.value?.didAllTablaturesFetched) != nil) {
//            self.model.value?.page! += 1
//            fetchData(text: searchText)
//        }
//    }
    
    func fetchTablatures(text: String) {
        
        loadingStatus.value = .start

        searchText = text
        
        let page = model.value?.page ?? 1
        
        let useCaseParameters = TablatureFinderRepositoryParameters(page: "\(page)", searchText: text)
        
        tablatureFinderUseCase.execute(params: useCaseParameters) { [weak self] result in
            
            switch result {
            case .success(let tablatureList):
                self?.loadingStatus.value = .stop
                self?.showEmptyStateError.value = false
                self?.model.value = tablatureList
                
//                if (self?.model.value == nil) {
//                    self?.model.value = tablatureList
                    //self?.delegate?.didLoadInitialTablatures()
//                } else {
                    // Add additional index paths fetched to tablatures array
//                    guard let newCount = tablatureList.tablatures?.count else { return }
//                    guard let initialCount = self?.model.value?.tablatures?.count else { return }
//                    let totalCount = initialCount + newCount
//                    let startingUpdateIndex = totalCount - newCount
//                    let indexPathsToAdd: [IndexPath] = Array(startingUpdateIndex..<(startingUpdateIndex+newCount)).compactMap { row in
//                        return IndexPath(row: row, section: 0)
//                    }
    
                    //self?.model.value?.tablatures?.append(contentsOf: tablatureList.tablatures!)
                    //self?.delegate?.didLoadMoreTablatures(with: indexPathsToAdd)
//                }
                
            case .failure(_):
                self?.loadingStatus.value = .stop
                self?.model.value? = TablatureListModel(tablatures: [])
                self?.showEmptyStateError.value = true
                //self?.model.value?.didAllTablaturesFetched = true
            }
        }
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
