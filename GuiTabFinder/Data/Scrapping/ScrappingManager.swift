//
//  ScrappingManager.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import Foundation


class ScrappingManager {
    // TODO: Refactor web scrapping management for a framework if exists
    
    static var shared = ScrappingManager()
    
    private init() {}
    
    func getTablatureListFromFetchingData(with stringSearchResult: String) -> TablatureListModel?  {
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
    
    func getStringFromHtml(_ htmlString: String, _ leftSideString: String, _ rightSideString: String) -> String? {
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
