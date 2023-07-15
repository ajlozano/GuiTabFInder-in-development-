//
//  TablatureListUseCase.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 15/7/23.
//

import Foundation

// MARK: TablatureListUseCase - Protocol

protocol TablatureListUseCase {
    
    func execute(params: TablatureListRepository, completion: @escaping (Result<TablatureListModel, AppError>) -> Void)
}

// MARK: DefaultTablatureListUseCase - Class

final class DefaultTablatureListUseCase: TablatureListUseCase {
    
    private var repository: TablatureListRepository
    private var paginationUrl: String?
    private var hasFetchedAllTablatures: Bool = false
    
    init(repository: TablatureListRepository = DefaultTablatureListRepository()) {
        self.repository = repository
    }
}

// MARK: DefaultTablatureListUseCase - Execute

extension DefaultTablatureListUseCase {
    
    func execute(params: TablatureListRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void) {
        
        let completion: (Result<TablatureListModel, AppError>) -> Void = { [weak self] result in
            switch result {
            case .success(let tablatures):
                self?.hasFetchedAllTablatures = false
                completion(.success(tablatures))
            case .failure(let error):
                self?.hasFetchedAllTablatures = true
                completion(.failure(error))
            }
        }
        
        let repositoryParams = TablatureListRepositoryParameters(paginationURL: paginationUrl, searchText: params.searchText)
        repository.getTablatures(params: repositoryParams, completion: completion)
    }
}
