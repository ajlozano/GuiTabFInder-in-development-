//
//  TablatureListRepositorySuccess+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureListRepositorySuccess_Mock: TablatureListRepository {
    func getTablatures(params: TablatureListRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void) {
        
        
        completion(.success(<#T##TablatureListModel#>))
    }
}
