//
//  TablatureListUseCase+Test.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 26/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureListUseCaseTest: XCTestCase {

    var successUseCase: TablatureListUseCase?
    var failureUseCase: TablatureListUseCase?
    
    override func setUp() {
        super.setUp()
        successUseCase = DefaultTablatureListUseCase(repository: TablatureListRepositorySuccessMock())
        failureUseCase = DefaultTablatureListUseCase(repository: TablatureListRepositoryFailureMock())
    }

    override func tearDown() {
        successUseCase = nil
        failureUseCase = nil
        super.tearDown()
    }
    
    func testTablatureListUseCase_Success() {
        let expectation = expectation(description: "You must obtain a valid entity that contains a model info with valid values.")
        
        let parameters = TablatureListRepositoryParameters(page: "1", searchText: "Insomnium")
        successUseCase?.execute(params: parameters) { result in
            switch result {
            case .success(let tablatureList):
                
                XCTAssertNotNil(tablatureList.didAllTablaturesFetched)
                XCTAssertNotNil(tablatureList.page)
                
                // TablatureDetail model assertions
                XCTAssertNotNil(tablatureList.tablatures)
                XCTAssertEqual(tablatureList.tablatures?.count, 17)
                
                for tabs in tablatureList.tablatures! {
                    XCTAssertNotNil(tabs.artist)
                    XCTAssertNotNil(tabs.rating)
                    XCTAssertNotNil(tabs.songName)
                    XCTAssertNotNil(tabs.tabId)
                    XCTAssertNotNil(tabs.tabUrl)
                    XCTAssertNotNil(tabs.votes)
                }
                
                expectation.fulfill()
                
            case .failure(_):
                XCTFail("Success test must not fail when the usecase is executed")
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testTablatureListUseCase_Failure() {
        let expectation = expectation(description: "You should get an error and it should not be nil")

        let parameters = TablatureListRepositoryParameters(page: "1", searchText: "djfjsdjsja")
        failureUseCase?.execute(params: parameters) { result in
            switch result {
            case .success(_):
                XCTFail("Failure test must not succeed when the usecase is executed")
            case .failure(let error):
                XCTAssertNotNil(error)

                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
