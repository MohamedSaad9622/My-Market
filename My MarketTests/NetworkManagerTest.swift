//
//  NetworkManagerTest.swift
//  My MarketTests
//
//  Created by MAC on 26/08/2022.
//

import XCTest
@testable import My_Market

class NetworkManagerTest: XCTestCase {

    var apiServices: FetchProductsProtocol?
    
    override func setUp() {
        apiServices = NetworkManagerMock(shouldReturnError: false)
    }
    
    override func tearDown() {
        apiServices = nil
    }
    
    func testFetchProducts() {
        apiServices?.fetchProducts(completion: { products, error in
            XCTAssertNil(error)
            XCTAssertNotNil(products)
        })
    }

}
