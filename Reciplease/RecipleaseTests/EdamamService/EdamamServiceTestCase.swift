//
//  EdamamServiceTestCase.swift
//  RecipleaseTests
//
//  Created by David Da Silva on 01/02/2022.
//

@testable import Reciplease
import XCTest

class ExchangeRateServiceTestCase: XCTestCase {
    
    // MARK: - Property
    var ingredients = ["chicken"]
    
    // MARK: - Tests functions
    func testGetExchangeRateShouldPostFailedCallbackIfError() {
        // Given
        let edamamService = EdamamService(edamamSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)
        )
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            expectation.fulfill()
        })
        
        edamamService.getRecipes(for: ingredients, callback: { success, recipes in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
        })
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetExchangeRateShouldPostFailedCallbackIfNoData() {
        // Given
        let edamamService = EdamamService(edamamSession: URLSessionFake(data: nil, response: nil, error: nil)
        )
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        edamamService.getRecipes(for: ingredients, callback: { success, recipes in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetExchangeRateShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let edamamService = EdamamService(edamamSession: URLSessionFake(data: FakeResponseData.exchangeRateCorrectData, response: FakeResponseData.responseKO, error: nil)
        )
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        edamamService.getRecipes(for: ingredients, callback: { success, recipes in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetExchangeRateShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let edamamService = EdamamService(edamamSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        edamamService.getRecipes(for: ingredients, callback: { success, recipes in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testGetExchangeRateShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let edamamService = EdamamService(edamamSession: URLSessionFake(data: FakeResponseData.exchangeRateCorrectData, response: FakeResponseData.responseOK,
                                                                        error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        edamamService.getRecipes(for: ingredients, callback: { success, recipes in
        //Then
        let q = "chicken"
        let from = 0
        let to = 10
        let more = true
        let count = 120230111
            
        XCTAssertTrue(success)
        XCTAssertNotNil(recipes)
        XCTAssertEqual(q, recipes?.q)
        XCTAssertEqual(from, recipes?.from)
        XCTAssertEqual(to, recipes?.to)
        XCTAssertEqual(more, recipes?.more)
        XCTAssertEqual(count, recipes?.count)
            
        expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 0.1)
    }
    
}
