//
//  APIClientTests.swift
//  MailBoxKit
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import XCTest
@testable import MailBoxKit

class APIClientTests: XCTestCase {
    
    var apiClient: APIClient! = nil
    
    override func setUp() {
        super.setUp()
        let config = Config(baseUrl: "http://maillabs.softxpertdev.com/api/v0")
        let core = MailBoxCore(config: config)
        apiClient = APIClient(core: core)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIClient() {
        
        let asyncApiCallExpectation = self.expectation(description: "asyncApiCallExpectation")
        
        apiClient.postJson("http://maillabs.softxpertdev.com/api/v0/mails/actions/scan", params: nil, headers: nil) { (object, error) in
                    
            
            XCTAssertNotNil(object)
            XCTAssertNil(error)
            asyncApiCallExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error)
        }
    }
    
}
