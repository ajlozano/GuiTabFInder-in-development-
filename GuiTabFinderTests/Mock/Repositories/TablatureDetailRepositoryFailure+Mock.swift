//
//  TablatureDetailRepositoryFailure+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureDetailRepositoryFailureMock: TablatureDetailRepository {
    func getTablatureDetail(params: GuiTabFinder.TablatureDetailRepositoryParameters, completion: @escaping (String?, String?) -> Void) {
        
        let tuningString = ScrappingManager.shared.getStringFromHtml("", GuiTabFinder.TFEndpoints.leftSide.tabTuningBlockEnding, GuiTabFinder.TFEndpoints.rightSide.tabTuningBlockEnding)

        let resultBlockString = ScrappingManager.shared.getStringFromHtml("", TFEndpoints.leftSide.tabBlock, TFEndpoints.rightSide.tabBlockEnding)
        
        completion(resultBlockString, tuningString)
    }
}
