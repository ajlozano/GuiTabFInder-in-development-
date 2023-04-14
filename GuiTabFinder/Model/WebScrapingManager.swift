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
    
    func getTabFromHtml(url: String, completion: @escaping (String?, String?) -> ()) {
        fetchDataFromUrl(url: url) { stringHtml in
            //Scrape all the information from the HTML
            let tuningString = self.getStringFromHtml(stringHtml, leftSide.tabTuningBlockEnding, rightSide.tabTuningBlockEnding)
          
            //Scrape all the information from the HTML
            if let resultBlockString = self.getStringFromHtml(stringHtml, leftSide.tabBlock, rightSide.tabBlockEnding) {
                var tabBlock = resultBlockString
                tabBlock = tabBlock.replacingOccurrences(of: "\\n", with: "\n")
                tabBlock = tabBlock.replacingOccurrences(of: "\\r", with: "")
                tabBlock = tabBlock.replacingOccurrences(of: "[/tab]", with: "")
                tabBlock = tabBlock.replacingOccurrences(of: "[tab]", with: "")
                
                completion(tabBlock, tuningString)
            }
        }
    }
    
    func getSearchResultsFromHtml(titleName: String, completion: @escaping ([SongDetails]) -> ()) {

        let fixedTitleName = titleName.replacingOccurrences(of: " ", with: "%20")
        
        let url = HeaderURL.titleSearchUg + fixedTitleName + Endpoints.urlTabTypeUg

        fetchDataFromUrl(url: url) { stringHtml in
            let stringHtmlToScrape = stringHtml
            var resultBlockToScrape = ""
            var idRow: String?
            
            //Scrape all the information from the HTML
            if let resultBlockString = self.getStringFromHtml(stringHtmlToScrape, leftSide.results, rightSide.result) {
                
                // Add final block part to allow getting last song from results
                resultBlockToScrape = leftSide.results + resultBlockString + rightSide.result
                var songs = [SongDetails]()
                
                repeat {
                    if let idBlockString = self.getStringFromHtml(resultBlockToScrape, leftSide.tabId, rightSide.tabId) {
                        idRow = idBlockString
                        guard let blockString = self.getStringFromHtml(resultBlockToScrape, "\(leftSide.tabId)\(idBlockString)", "\(idBlockString)\(rightSide.blockEnding)") else {
                            print("Error getting String from Html")
                            idRow = nil
                            return
                        }
                        if let artistName = self.getStringFromHtml(blockString, leftSide.artist, rightSide.artist),
                           let songName = self.getStringFromHtml(blockString, leftSide.song, rightSide.song),
                           let songPartRaw = self.getStringFromHtml(blockString, leftSide.part, rightSide.part),
                           let songVersionRaw = self.getStringFromHtml(blockString, leftSide.version, rightSide.version),
                           let votes = self.getStringFromHtml(blockString, leftSide.votes, rightSide.votes),
                           let ratingRaw = self.getStringFromHtml(blockString, leftSide.rating, rightSide.rating),
                           let tabUrl = self.getStringFromHtml(blockString+idBlockString+rightSide.blockEnding, leftSide.tabUrl, idBlockString+rightSide.blockEnding){

                            let rating = ratingRaw == "0" ? "0" : ratingRaw.dropLast(ratingRaw.count - 3)
                            var songNameComplete = songName
                            songNameComplete += songPartRaw == "" ? "" : " \(songPartRaw)"
                            songNameComplete += songVersionRaw == "1" ? "" : " (ver \(songVersionRaw))"
                            
                            songs.append(SongDetails(artist: artistName, songName: songNameComplete , tabId: idBlockString, rating: String(rating), votes: votes, tabUrl: tabUrl+idBlockString, tab: ""))
                        }
                        // Delete HTML scraped part
                        resultBlockToScrape = resultBlockToScrape.replacingOccurrences(
                            of: "\(leftSide.tabId)\(idBlockString)\(blockString)\(idBlockString)\(rightSide.blockEnding)",
                            with: " ")
                    } else {
                        print("Error getting Id Row from HTML")
                        idRow = nil
                    }
                } while idRow != nil
                
                completion(songs)
            }
        }
    }
    
    private func fetchDataFromUrl(url: String, completion: @escaping (String) -> ()) {
        guard let urlString = URL(string: url) else {
            print("Error constructing URL resource")
            return
        }
        let task = URLSession.shared.dataTask(with: urlString) { (data, resp, error) in
            guard let data = data else {
                print("data task was nil")
                return
            }
            guard let stringHtml = String(data: data, encoding: .utf8) else {
                print("error casting data into string")
                return
            }
            
            completion(stringHtml)
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
