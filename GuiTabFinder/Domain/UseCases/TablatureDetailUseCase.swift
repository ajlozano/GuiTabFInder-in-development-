//
//  TablatureDetailUseCase.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 17/7/23.
//

import Foundation

// MARK: TablatureDetailUseCase - Protocol

protocol TablatureDetailUseCase {
    
    func execute(params: TablatureDetailRepositoryParameters, completion: @escaping (String?, String?) -> Void)
}

// MARK: DefaultTablatureDetailUseCase - Class

final class DefaultTablatureDetailUseCase: TablatureDetailUseCase {
    
    private var repository: TablatureDetailRepository
    private var hasFetchedAllTablatures: Bool = false
    
    init(repository: TablatureDetailRepository = DefaultTablatureDetailRepository()) {
        self.repository = repository
    }
}

// MARK: DefaultTablatureDetailUseCase - Execute

extension DefaultTablatureDetailUseCase {
    
    func execute(params: TablatureDetailRepositoryParameters, completion: @escaping (String?, String?) -> Void) {
        
        repository.getTablatureDetail(params: params) { detail, tuning in
            completion(detail, tuning)
        }
    }
}
