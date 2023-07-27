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
        guard let urlString = URL(string: params.tablatureURL) else {
            print("Error constructing URL resource")
            return
        }
        let task = URLSession.shared.dataTask(with: urlString) { (data, resp, error) in
            guard let data = data, let stringHtml = String(data: data, encoding: .utf8) else {
                print("data task error")
                completion(nil, nil)
                return
            }
            
            //Scrape all the information from the HTML
            let tuningString = ScrappingManager.shared.getStringFromHtml(stringHtml, TFEndpoints.leftSide.tabTuningBlockEnding, TFEndpoints.rightSide.tabTuningBlockEnding)
          
            //Scrape all the information from the HTML
            if let resultBlockString = ScrappingManager.shared.getStringFromHtml(stringHtml, TFEndpoints.leftSide.tabBlock, TFEndpoints.rightSide.tabBlockEnding) {
                var tabBlock = resultBlockString
                tabBlock = tabBlock.replacingOccurrences(of: "\\n", with: "\n")
                tabBlock = tabBlock.replacingOccurrences(of: "\\r", with: "")
                tabBlock = tabBlock.replacingOccurrences(of: "[/tab]", with: "")
                tabBlock = tabBlock.replacingOccurrences(of: "[tab]", with: "")
                
                completion(tabBlock, tuningString)
            }
        }
        task.resume()
    }
}
