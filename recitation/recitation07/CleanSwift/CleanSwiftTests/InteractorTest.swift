//
//  InteractorTest.swift
//  CleanSwiftTests
//
//  Created by Dmitry An on 14/12/2023.
//

import XCTest

@testable import CleanSwift

final class InteractorTest: XCTestCase {

    private var interactor: Interactor!
    private var presenter: PresenterSpy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.presenter = PresenterSpy()
        self.interactor = Interactor(presenter: presenter)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.interactor = nil
        self.presenter = nil
    }

    
    func testUpdateScreen() {
        interactor.updateScreen()
        XCTAssertTrue(presenter.wasUpdateCalled)
    }
    
    func testModifyNumberMoreThan10() {
        let result:Int = interactor.modifyNumber(number: 11)
        XCTAssertEqual(result, 33)
    }
    
    func testModifyNumberLessThan10() {
        let result:Int = interactor.modifyNumber(number: 9)
        XCTAssertEqual(result, 6)
    }
    
    func testSomeFuncFirst() {
        let result = interactor.someFunc(text: "ABC", selector: .first)
        XCTAssertEqual(result, ["A"])
    }
    
    func testSomeFuncLast() {
        let result = interactor.someFunc(text: "ABC", selector: .last)
        XCTAssertEqual(result, ["C"])
    }
    
    func testSomeFuncAll() {
        let result = interactor.someFunc(text: "ABC", selector: .all)
        XCTAssertEqual(result, ["A","B","C"])
    }
    
    func testSomeFuncEmptyString() {
        let result = interactor.someFunc(text: "", selector: .last)
        XCTAssertEqual(result, [Character]())
    }
    
    func testSomeFuncNilCase() {
        let result = interactor.someFunc(text: "ABC", selector: nil)
        XCTAssertEqual(result, [Character]())
    }
    
    func testStringsFuncIncludes() {
        interactor.stringsFunc(a: "ABCDE", b: "BCD")
        XCTAssertTrue(presenter.wasUpdateCalled)
    }
    
    func testStringsFuncExcludes() {
        interactor.stringsFunc(a: "ABCDE", b: "BCC")
        XCTAssertTrue(!presenter.wasUpdateCalled)
    }

}
