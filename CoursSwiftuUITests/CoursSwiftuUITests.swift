//
//  CoursSwiftuUITests.swift
//  CoursSwiftuUITests
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//

import XCTest
@testable import CoursSwiftuUI

final class CoursSwiftuUITests: XCTestCase {
    let viewModel = MainViewModel()


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    // Given
    // When
    // Then
    
    func testGiven_WhenAdditionTwoNumbersThenGettingSumOfThem() {
        let a = 2
        let b = 3
        let awaitedResult = 5
        var answer = 0
        XCTAssertTrue(awaitedResult != answer)
        
        answer = viewModel.additionne(a, et: b)
        
        XCTAssertTrue(awaitedResult == answer)
    }
    
    func testGivenIsValidTrueWhenLoginFalseThenIsValidFalse() {
        //Given
        viewModel.isValid = true
        let answerAwaited = false;
        let wrongLogin = "djsqldsqjkdqkls"
        let wrongPassword = "sqkldsj"
        XCTAssertTrue(viewModel.isValid != answerAwaited)
        // WHEN
        viewModel.checkConnection(login: wrongLogin, password: wrongPassword)
        // THEN
        XCTAssertTrue(viewModel.isValid == answerAwaited)
    }
    
    func testGivenIsValidTrueWhenLoginRightAndPasswordFalseThenIsValidFalse() {
        //Given
        viewModel.isValid = true
        let answerAwaited = false;
        let rightLogin = "Jean"
        let wrongPassword = "sqkldsj"
        XCTAssertTrue(viewModel.isValid != answerAwaited)
        // WHEN
        viewModel.checkConnection(login: rightLogin, password: wrongPassword)
        // THEN
        XCTAssertTrue(viewModel.isValid == answerAwaited)
    }
    
    func testGivenIsValidFalseWhenLoginAndPasswordAreRightThenIsValidTrue() {
        //Given
        viewModel.isValid = false
        let answerAwaited = true;
        let rightLogin = "Jean"
        let rightPassword = "12345"
        XCTAssertTrue(viewModel.isValid != answerAwaited)
        // WHEN
        viewModel.checkConnection(login: rightLogin, password: rightPassword)
        // THEN
        XCTAssertTrue(viewModel.isValid == answerAwaited)
    }
}
