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
                    guard let tablaturesList = self.manageFetchDataResult(with: stringSearchResult) else {
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
    
    private func manageFetchDataResult(with stringSearchResult: String) -> TablatureListModel?  {
        var resultBlockToScrape = ""
        var idRow: String?
        
        //Scrape all the information from the HTML
        if let resultBlockString = self.getStringFromHtml(stringSearchResult, TFEndpoints.leftSide.results, TFEndpoints.rightSide.result) {
            
            // Add final block part to allow getting last song from results
            resultBlockToScrape = TFEndpoints.leftSide.results + resultBlockString + TFEndpoints.rightSide.result
            var tablatures = [TablatureDetail]()
            
            repeat {
                if let idBlockString = self.getStringFromHtml(resultBlockToScrape, TFEndpoints.leftSide.tabId, TFEndpoints.rightSide.tabId) {
                    idRow = idBlockString
                    guard let blockString = self.getStringFromHtml(resultBlockToScrape, "\(TFEndpoints.leftSide.tabId)\(idBlockString)", "\(idBlockString)\(TFEndpoints.rightSide.blockEnding)") else {
                        print("Error getting String from Html")
                        idRow = nil
                        return nil
                    }
                    
                    if let artistName = self.getStringFromHtml(blockString, TFEndpoints.leftSide.artist, TFEndpoints.rightSide.artist),
                       let songName = self.getStringFromHtml(blockString, TFEndpoints.leftSide.song, TFEndpoints.rightSide.song),
                       let songPartRaw = self.getStringFromHtml(blockString, TFEndpoints.leftSide.part, TFEndpoints.rightSide.part),
                       let songVersionRaw = self.getStringFromHtml(blockString, TFEndpoints.leftSide.version, TFEndpoints.rightSide.version),
                       let votes = self.getStringFromHtml(blockString, TFEndpoints.leftSide.votes, TFEndpoints.rightSide.votes),
                       let ratingRaw = self.getStringFromHtml(blockString, TFEndpoints.leftSide.rating, TFEndpoints.rightSide.rating),
                       let tabUrl = self.getStringFromHtml(blockString+idBlockString+TFEndpoints.rightSide.blockEnding, TFEndpoints.leftSide.tabUrl, idBlockString+TFEndpoints.rightSide.blockEnding){
                        
                        if (blockString.contains(songName+TFEndpoints.rightSide.containMarketingType) == false) {
                            let rating = ratingRaw == "0" ? "0" : ratingRaw.dropLast(ratingRaw.count - 3)
                            var songNameComplete = songName
                            songNameComplete += songPartRaw == "" ? "" : " \(songPartRaw)"
                            songNameComplete += songVersionRaw == "1" ? "" : " (ver \(songVersionRaw))"
                            
                            if (songNameComplete == "Decoherence") {
                                //print(blockString)
                                print(tabUrl+idBlockString)
                            }
                            tablatures.append(TablatureDetail(artist: artistName, songName: songNameComplete , tabId: idBlockString, rating: String(rating), votes: votes, tabUrl: tabUrl+idBlockString, tab: ""))
                        }
                    }
                    // Delete HTML scraped part
                    resultBlockToScrape = resultBlockToScrape.replacingOccurrences(
                        of: "\(TFEndpoints.leftSide.tabId)\(idBlockString)\(blockString)\(idBlockString)\(TFEndpoints.rightSide.blockEnding)",
                        with: " ")
                } else {
                    //print("Error getting Id Row from HTML")
                    idRow = nil
                }
            } while idRow != nil
            
            if (tablatures.count == 0) { return nil }
            
            return TablatureListModel(tablatures: tablatures, didAllTablaturesFetched: false, page: 1)
        }
        
        return nil
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
