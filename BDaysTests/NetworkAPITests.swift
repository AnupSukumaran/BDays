//
//  NetworkAPITests.swift
//  BDaysTests
//
//  Created by Sukumar Anup Sukumaran on 30/05/2022.
//

import XCTest
@testable import BDays

class NetworkAPITests: XCTestCase {
    
    var sut: Network!

    override func setUpWithError() throws {
        sut = Network()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCallBirthdaysAPI() throws {
        
        let expect = XCTestExpectation(description: "callback")
        
        sut.callBirthdaysAPI { result in
            expect.fulfill()
            switch result {
            case .success(let personArr):
                XCTAssertNotNil(personArr)
                
            case .failure(errorStr: let err, _):
                XCTFail(err)
            }
        }
        
        wait(for: [expect], timeout: 3.1)
    }

    

}
