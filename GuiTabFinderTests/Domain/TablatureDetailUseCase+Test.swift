//
//  TablatureDetailUseCase+Test.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 26/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureDetailUseCaseTest: XCTestCase {

    var successUseCase: TablatureDetailUseCase?
    var failureUseCase: TablatureDetailUseCase?
    
    override func setUp() {
        super.setUp()
        successUseCase = DefaultTablatureDetailUseCase(repository: TablatureDetailRepositorySuccessMock())
        failureUseCase = DefaultTablatureDetailUseCase(repository: TablatureDetailRepositoryFailureMock())
    }

    override func tearDown() {
        successUseCase = nil
        failureUseCase = nil
        super.tearDown()
    }
    
    func testTablatureDetailUseCase_Success() {
        let expectation = expectation(description: "You must obtain a valid entity that contains a model info with valid values.")
        
        let parameters = TablatureDetailRepositoryParameters(tablatureURL: "")
        successUseCase?.execute(params: parameters) { tabDetail, tuning in
            XCTAssertNotNil(tabDetail)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testTablatureDetailUseCase_Failure() {
        let expectation = expectation(description: "You should get a nil instead of a value")

        let parameters = TablatureDetailRepositoryParameters(tablatureURL: "")
        failureUseCase?.execute(params: parameters) { tabDetail, tuning in
            if let _ = tabDetail {
                XCTFail("Failure test must not succeed when the usecase is executed")
            } else {
                XCTAssertNil(tabDetail)

                expectation.fulfill()
            }

        }
        wait(for: [expectation], timeout: 5)
    }
}
