//
//  TablatureSelectorViewModel+Test.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 28/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureSelectorViewModelTest: XCTestCase {

    // GIVEN
    //Subject Under Test
    var successViewModel: TablatureFinderViewModel?
    var failureViewModel: TablatureFinderViewModel?
    
    //Injected Objects
    var successUseCase: TablatureFinderUseCase?
    var failureUseCase: TablatureFinderUseCase?
    
    override func setUp() {
        super.setUp()
        successUseCase = DefaultTablatureFinderUseCase(repository: TablatureFinderRepositorySuccessMock())
        failureUseCase = DefaultTablatureFinderUseCase(repository: TablatureFinderRepositoryFailureMock())
        
        successViewModel = DefaultTablatureFinderViewModel(tablatureFinderUseCase: successUseCase!)
        failureViewModel = DefaultTablatureFinderViewModel(tablatureFinderUseCase: failureUseCase!)
    }
    
    override func tearDown() {
        successUseCase = nil
        failureUseCase = nil
        successViewModel = nil
        successViewModel = nil
        
        super.tearDown()
    }
    
    func testFetchTablatures_UseCaseSuccess() {
        let expectation = expectation(description: "After the correct execution of the UseCase, the model must be created and binded, obtaining 17 tablatures as tablatureDetailModel and false on showEmptyStateError")
        // THEN
        successViewModel?.model.bind { model in
            guard let model = model else { return }
            guard let tablatures = model.tablatures else { return }
            XCTAssertNotNil(model)
            XCTAssertTrue(tablatures.count == 17)
            for tablature in tablatures {
                XCTAssertNotNil(tablature.artist)
                XCTAssertNotNil(tablature.songName)
                XCTAssertNotNil(tablature.tabId)
                XCTAssertNotNil(tablature.rating)
                XCTAssertNotNil(tablature.votes)
                XCTAssertNotNil(tablature.tabUrl)
            }
            
            expectation.fulfill()
        }
        
        successViewModel?.showEmptyStateError.bind { error in
            guard let error = error, error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }
        
        successViewModel?.fetchTablatures(text: "Insomnium")
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchTablatures_UseCaseFailure() {
        let expectation = expectation(description: "The execution of the UseCase should return failure, showEmptyStateError must be binded, obtaining true.")
                    
        failureViewModel?.model.bind { model in
            XCTAssertNil(model)
        }
        
        failureViewModel?.showEmptyStateError.bind { error in
            guard let error = error else { return }
            XCTAssertTrue(error)
            expectation.fulfill()
        }
        
        failureViewModel?.fetchTablatures(text: "")
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testSelectCell_Success() {
        let expectation = expectation(description: "When selecting any of the available tablature, the selected valid model is assigned to the tablatureDetailModel")

        successViewModel?.model.bind { [weak self] model in
            guard let self = self,
                  let model = model else { return }

            XCTAssertNotNil(model)
            self.successViewModel?.selectCell(atIndex: 0)
        }

        successViewModel?.tablatureDetailModel.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            XCTAssertNotNil(model.artist)
            XCTAssertNotNil(model.songName)
            XCTAssertNotNil(model.tabId)
            XCTAssertNotNil(model.rating)
            XCTAssertNotNil(model.votes)
            XCTAssertNotNil(model.tabUrl)
            XCTAssertNotNil(model.tab)
            
            expectation.fulfill()
        }

        successViewModel?.showEmptyStateError.bind { error in
            guard let error = error, error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }

        successViewModel?.fetchTablatures(text: "Insomnium")

        wait(for: [expectation], timeout: 10)
    }
    
    func testClearList_Success() {
        successViewModel?.clearList()
        
        XCTAssertNil(successViewModel?.model.value)
        XCTAssertNil(successViewModel?.tablatureDetailModel.value)
        XCTAssertNotNil(successViewModel?.showEmptyStateError.value)
    }
}
