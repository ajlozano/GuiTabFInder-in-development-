//
//  TablatureDetailRepositorySuccess+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureDetailRepositorySuccessMock: TablatureDetailRepository {
    func getTablatureDetail(params: GuiTabFinder.TablatureDetailRepositoryParameters, completion: @escaping (String?, String?) -> Void) {
        
        let stringHtml = TablatureDetailMock.makeHtmlMock()
        
        let tuningString = ScrappingManager.shared.getStringFromHtml(stringHtml, GuiTabFinder.TFEndpoints.leftSide.tabTuningBlockEnding, GuiTabFinder.TFEndpoints.rightSide.tabTuningBlockEnding)

        guard let resultBlockString = ScrappingManager.shared.getStringFromHtml(stringHtml, TFEndpoints.leftSide.tabBlock, TFEndpoints.rightSide.tabBlockEnding) else {
            completion(nil, nil)
            return
        }
        
        var tabBlock = resultBlockString
        tabBlock = tabBlock.replacingOccurrences(of: "\\n", with: "\n")
        tabBlock = tabBlock.replacingOccurrences(of: "\\r", with: "")
        tabBlock = tabBlock.replacingOccurrences(of: "[/tab]", with: "")
        tabBlock = tabBlock.replacingOccurrences(of: "[tab]", with: "")
        
        completion(tabBlock, tuningString)
    }
}
