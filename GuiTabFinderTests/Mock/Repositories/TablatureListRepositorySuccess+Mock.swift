//
//  TablatureListRepositorySuccess+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureListRepositorySuccessMock: TablatureListRepository {
    func getTablatures(params: TablatureListRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void) {
    
        let htmlString = TablatureListMock.makeHtmlMock()
        
        guard let tablatureList = ScrappingManager.shared.getTablatureListFromFetchingData(with: htmlString) else {
            completion(.failure(AppError.manageFetchDataError(message: "Error formatting fetched data")))
            return
        }
        
        completion(.success(tablatureList))
    }
}
