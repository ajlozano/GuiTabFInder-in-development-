//
//  TablatureListRepositorySuccess+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureFinderRepositorySuccessMock: TablatureFinderRepository {
    func getTablatures(params: TablatureFinderRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void) {
    
        let htmlString = TablatureFinderMock.makeHtmlMock()
        
        guard let tablatureList = ScrappingManager.shared.getTablatureListFromFetchingData(with: htmlString) else {
            completion(.failure(AppError.manageFetchDataError(message: "Error formatting fetched data")))
            return
        }
        
        completion(.success(tablatureList))
    }
}
