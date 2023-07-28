//
//  TablatureRepository.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 15/7/23.
//

import Foundation


// MARK: TablatureListRepository - protocol

protocol TablatureListRepository {
    func getTablatures(params: TablatureListRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void)
}

// MARK: DefaultTablatureListRepository - class

final class DefaultTablatureListRepository: TablatureListRepository {
    private weak var task: URLSessionTask?
    
    func getTablatures(params: TablatureListRepositoryParameters, completion: @escaping (Result<TablatureListModel, AppError>) -> Void) {
        
        let endpoint = TFEndpoints.generateURLWithParams(baseUrl: TFEndpoints.HeaderURL.titleSearchUg, searchText: params.searchText, page: params.page)
        
        task?.cancel()
        
        guard let url = URL(string: endpoint) else {
            let error: AppError = .serviceError(message: "Malformed URL for getTransactions in TablatureListRepository")
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            self.manageResponse(data: data, response: response, error: error) { result in
                switch result {
                case .success(let stringSearchResult):
                    guard let tablaturesList = ScrappingManager.shared.getTablatureListFromFetchingData(with: stringSearchResult) else {
                        completion(.failure(AppError.manageFetchDataError(message: "Error formatting fetched data")))
                        return
                    }
                    var tablatureListModel = tablaturesList
                    tablatureListModel.page = Int(params.page)
                    completion(.success(tablatureListModel))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        })
        
        task?.resume()
    }
}

// MARK: DefaultTablatureListRepository - Manage Data

extension DefaultTablatureListRepository {
    
    func manageResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<String, AppError>) -> Void) {
        
        if let responsestatus = (response as? HTTPURLResponse)?.statusCode, responsestatus != 200 {
            let error: AppError = .serviceError(message: "Error when when fetching in TablatureListRepository")
            completion(.failure(error))
        }
        
        guard let data = data, let stringHtml = String(data: data, encoding: .utf8) else {
            let error: AppError = .serviceError(message: "No Data Received when fetching in TablatureListRepository")
            completion(.failure(error))
            return
        }

        completion(.success(stringHtml))
    }
}
