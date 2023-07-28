//
//  TablatureFinderUseCase.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 15/7/23.
//

import Foundation

// MARK: TablatureFinderUseCase - Protocol

protocol TablatureFinderUseCase {
    
    func execute(params: TablatureFinderRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void)
}

// MARK: DefaultTablatureFinderUseCase - Class

final class DefaultTablatureFinderUseCase: TablatureFinderUseCase {
    
    private var repository: TablatureFinderRepository
    private var hasFetchedAllTablatures: Bool = false
    
    init(repository: TablatureFinderRepository = DefaultTablatureFinderRepository()) {
        self.repository = repository
    }
}

// MARK: DefaultTablatureFinderUseCase - Execute

extension DefaultTablatureFinderUseCase {
    
    func execute(params: TablatureFinderRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void) {
        
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
        
        repository.getTablatures(params: params, completion: completion)
    }
}
