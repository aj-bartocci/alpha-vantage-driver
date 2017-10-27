//
//  IntraDayConfigTests.swift
//  AlphaVantageDriverTests
//
//  Created by AJ Bartocci on 10/26/17.
//

@testable import AlphaVantageDriver
import XCTest

class IntraDayConfigTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}

extension IntraDayConfigTests {
    // urlRequest
    
    func test_urlRequest_symbol_AAPL() {
        let sut = AVFIntraDayConfig.intraday(symbol: .value("AAPL"), interval: .min30, type: .json, size: .compact, apiKey: .key(""))
        
    }
}

extension IntraDayConfigTests {
    // Objects Key
    func test_objectsKey_interval_1min() {
        xtest_objectsKey(expected: "Time Series (1min)", from: .min1)
    }
    
    func test_objectsKey_interval_5min() {
        xtest_objectsKey(expected: "Time Series (5min)", from: .min5)
    }
    
    func test_objectsKey_interval_15min() {
        xtest_objectsKey(expected: "Time Series (15min)", from: .min15)
    }
    
    func test_objectsKey_interval_30min() {
        xtest_objectsKey(expected: "Time Series (30min)", from: .min30)
    }
    
    func test_objectsKey_interval_60min() {
        xtest_objectsKey(expected: "Time Series (60min)", from: .min60)
    }
    
    func xtest_objectsKey(expected: String, from interval: AVFIntraDayConfig.Interval) {
        let sut = AVFIntraDayConfig.intraday(symbol: .value(""), interval: interval, type: .json, size: .compact, apiKey: .key(""))
        XCTAssertEqual(expected, sut.objectsKey)
    }
}








