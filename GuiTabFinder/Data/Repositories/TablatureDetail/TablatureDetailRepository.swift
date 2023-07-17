//
//  TablatureDetailRepository.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 17/7/23.
//

import Foundation

// MARK: TablatureDetailRepository - protocol

protocol TablatureDetailRepository {
    func getTablatureDetail(params: TablatureDetailRepositoryParameters, completion: @escaping (String?, String?) -> Void)
}

// MARK: DefaultTablatureDetailRepository - Protocol

final class DefaultTablatureDetailRepository: TablatureDetailRepository {
    
    func getTablatureDetail(params: TablatureDetailRepositoryParameters, completion: @escaping (String?, String?) -> Void) {
        
        fetchDataFromUrl(url: params.tablatureURL) { result in
            switch result {
            case .success(let stringData):
                //Scrape all the information from the HTML
                let tuningString = self.getStringFromHtml(stringData, TFEndpoints.leftSide.tabTuningBlockEnding, TFEndpoints.rightSide.tabTuningBlockEnding)
              
                //Scrape all the information from the HTML
                if let resultBlockString = self.getStringFromHtml(stringData, TFEndpoints.leftSide.tabBlock, TFEndpoints.rightSide.tabBlockEnding) {
                    var tabBlock = resultBlockString
                    tabBlock = tabBlock.replacingOccurrences(of: "\\n", with: "\n")
                    tabBlock = tabBlock.replacingOccurrences(of: "\\r", with: "")
                    tabBlock = tabBlock.replacingOccurrences(of: "[/tab]", with: "")
                    tabBlock = tabBlock.replacingOccurrences(of: "[tab]", with: "")
                    
                    completion(tabBlock, tuningString)
                }
            case .failure(_):
                completion(nil, nil)
            }
        }
    }
    
    private func fetchDataFromUrl(url: String, completion: @escaping (Result<String, AppError>) -> ()) {
        guard let urlString = URL(string: url) else {
            print("Error constructing URL resource")
            return
        }
        let task = URLSession.shared.dataTask(with: urlString) { (data, resp, error) in
            guard let data = data, let stringHtml = String(data: data, encoding: .utf8) else {
                print("data task error")
                completion(.failure(AppError.serviceError(message: "Error getting data from URL")))
                return
            }
  
            completion(.success(stringHtml))
        }
        task.resume()
    }
    
    private func getStringFromHtml(_ htmlString: String, _ leftSideString: String, _ rightSideString: String) -> String? {
        guard let leftRangeIdBlock = htmlString.range(of: leftSideString) else {
            //print("cannot find left range")
            return nil
        }
        guard let rightRangeIdBlock = htmlString.range(of: rightSideString) else {
            //print("cannot find right range")
            return nil
        }
        let rangeOfStringBlock = leftRangeIdBlock.upperBound..<rightRangeIdBlock.lowerBound
        return String(htmlString[rangeOfStringBlock])
    }
}
