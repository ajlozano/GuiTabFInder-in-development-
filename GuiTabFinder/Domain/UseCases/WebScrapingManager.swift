//
//  WebScrapingManager.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 6/4/23.
//

import Foundation

struct WebScrapingManager {
    
    static let shared = WebScrapingManager()
    private init() { }
    
    func getSearchResultsFromHtml(text: String, completion: @escaping (Result<TablatureListModel, AppError>) -> ()) {

        let fixedTitleName = text.replacingOccurrences(of: " ", with: "%20")
        
        let url = TFEndpoints.HeaderURL.titleSearchUg + fixedTitleName + TFEndpoints.urlTabTypeUg

        fetchDataFromUrl(url: url) { result in
            switch result {
            case .success(let stringSearchResult):
                guard let tablaturesList = manageFetchDataResult(with: stringSearchResult) else {
                    completion(.failure(AppError.manageFetchDataError(message: "Error formatting fetched data")))
                    return
                }
                completion(.success(tablaturesList))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
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
                    print("Error getting Id Row from HTML")
                    idRow = nil
                }
            } while idRow != nil
            
            if (tablatures.count == 0) { return nil }
            
            return TablatureListModel(tablatures: tablatures)
        }
        
        return nil
    }
    
    func getTabFromHtml(url: String, completion: @escaping (String?, String?) -> ()) {
        fetchDataFromUrl(url: url) { result in
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
            print("cannot find left range")
            return nil
        }
        guard let rightRangeIdBlock = htmlString.range(of: rightSideString) else {
            print("cannot find right range")
            return nil
        }
        let rangeOfStringBlock = leftRangeIdBlock.upperBound..<rightRangeIdBlock.lowerBound
        return String(htmlString[rangeOfStringBlock])
    }
}
