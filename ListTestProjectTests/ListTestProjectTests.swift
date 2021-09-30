//
//  ListTestProjectTests.swift
//  ListTestProjectTests
//
//  Created by Eduardo David De La Cruz Marrero on 24/9/21.
//

import XCTest
@testable import ListTestProject

class ListTestProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let manager = TodoListManager.emptyState()
        XCTAssertTrue(manager.items.count == 0, "Should start with an empty list of todo's")
        
        manager.addItem()
        XCTAssertTrue(manager.items.count == 1, "Should have one todo after adding")
    }
}
