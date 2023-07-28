//
//  TablatureListRepositoryFailure+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureFinderRepositoryFailureMock: TablatureFinderRepository {
    func getTablatures(params: GuiTabFinder.TablatureFinderRepositoryParameters, completion: @escaping (Result<GuiTabFinder.TablatureListModel, GuiTabFinder.AppError>) -> Void) {
        
        guard let tablatureList = ScrappingManager.shared.getTablatureListFromFetchingData(with: "") else {
            completion(.failure(AppError.manageFetchDataError(message: "Error formatting fetched data")))
            return
        }
        completion(.success(tablatureList))
    }
}