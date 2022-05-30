//
//  BDaysTests.swift
//  BDaysTests
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import XCTest
@testable import BDays

class BDaysTests: XCTestCase {
    
    var sut: HomeViewModel!
    

    override func setUpWithError() throws {
        sut = HomeViewModel()
        
    }

    override func tearDownWithError() throws {
        sut = nil
        
    }

    func testGetInitials() throws {
        let initials = "Micah Mayer".getInitials()
        XCTAssertEqual(initials, "MM")
    }
    
    func testCheckDateFormate() throws {
        let date = "2020-05-31".convertDateFormate()
        XCTAssertEqual(date, "31-05-2020")
    }
    
    func testAgeValue() throws {
        let date = "2020-05-31".ageValue()
        XCTAssertEqual(date, "1 year(s) old")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
