//
//  BDaysUITests.swift
//  BDaysUITests
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import XCTest

class BDaysUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let frontTxt = app.staticTexts["Birthdays"]
        XCTAssertTrue(frontTxt.exists)
        
        let homeNav = app.navigationBars["Birthdays"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: homeNav, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
            let backBtn = app.buttons["GO BACK"]
            expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: backBtn, handler: nil)
            waitForExpectations(timeout: 5, handler: nil)
            backBtn.tap()
            
        }
    
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
