//
//  MainViewModel.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 5/4/23.
//

import Foundation
import UIKit

class MainViewModel {
    
    var songs: ObservableObject<[SongDetails]?> = ObservableObject(nil)
    
    //static let shared = MainViewModel()
    
    func scrapeDataFromUrl(titleName: String, completion: @escaping ([SongDetails]) -> ()) {

        let urlString = HeaderURL.titleSearchUg + titleName + Endpoints.urlTabTypeUg

        guard let url = URL(string: urlString) else {
            print("Error constructing URL resource")
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else {
                print("data task was nil")
                return
            }

            guard let stringHtml = String(data: data, encoding: .utf8) else {
                print("error casting data into string")
                return
            }
            //print(stringHtml)
            
            var stringHtmlToScrape = stringHtml
            var idRow: String?
            
            //Scrape all the information from de HTML
            repeat {
                if let idBlockString = self.getStringFromHtml(stringHtmlToScrape, leftSide.tabId, rightSide.tabId) {
                    idRow = idBlockString
                    guard let blockString = self.getStringFromHtml(stringHtmlToScrape, "\(leftSide.tabId)\(idBlockString)", "\(idBlockString)\(rightSide.blockEnding)") else {
                        print("Error getting String from Html")
                        idRow = nil
                        return
                    }
                    //print(blockString)
                    if let artistName = self.getStringFromHtml(blockString, leftSide.artist, rightSide.artist),
                       let songName = self.getStringFromHtml(blockString, leftSide.song, rightSide.song),
                       let songType = self.getStringFromHtml(blockString, leftSide.type, rightSide.type),
                       let songPart = self.getStringFromHtml(blockString, leftSide.part, rightSide.part),
                       let songVersion = self.getStringFromHtml(blockString, leftSide.version, rightSide.version),
                       let votes = self.getStringFromHtml(blockString, leftSide.votes, rightSide.votes),
                       let ratingRaw = self.getStringFromHtml(blockString, leftSide.rating, rightSide.rating),
                       let tabUrl = self.getStringFromHtml(blockString+idBlockString+rightSide.blockEnding, leftSide.tabUrl, rightSide.blockEnding){
                        
                        var rating: String.SubSequence = "0"
                        if (ratingRaw != "0") {
                            rating = ratingRaw.dropLast(ratingRaw.count - 4)
                        }
                        print("ID Row: \(idRow!) | Artist: \(artistName) | Song: \(songName) \(songPart) \(songVersion) | Type: \(songType) | Votes: \(votes) | Rating: \(rating)")
                        print("tab URL: \(tabUrl)\n")
                    }
                    // Delete HTML scraped part
                    stringHtmlToScrape = stringHtmlToScrape.replacingOccurrences(
                        of: "\(leftSide.tabId)\(idBlockString)\(blockString)\(idBlockString)&quot;}",
                        with: " ")
                } else {
                    print("Error getting Id Row from HTML")
                    idRow = nil
                }
            } while idRow != nil
        }
        task.resume()
        
    }
    
    func getStringFromHtml(_ htmlString: String, _ leftSideString: String, _ rightSideString: String) -> String? {
        guard let leftRangeIdBlock = htmlString.range(of: leftSideString) else {
            print("cannot find left range")
            return nil
        }
        guard let rightRangeIdBlock = htmlString.range(of: rightSideString) else {
            print("cannot find right range")
            return nil
        }
        
        let rangeOfValueBlock = leftRangeIdBlock.upperBound..<rightRangeIdBlock.lowerBound
        
        var valueBlock = htmlString[rangeOfValueBlock]
    
        //print("Value: \(valueBlock)")
        
        return String(valueBlock)
    }
    
}

