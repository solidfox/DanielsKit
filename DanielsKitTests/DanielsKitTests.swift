//
//  DanielsKitTests.swift
//  DanielsKitTests
//
//  Created by Daniel Schlaug on 6/29/14.
//  Copyright (c) 2014 Daniel Schlaug. All rights reserved.
//

import XCTest
import DanielsKit

class DanielsKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual(randomIndexFromDistribution([100]), 0)
        
        let dist = [0.2, 0.3, 0.4, 0.1]
        var counts = [Int](count:dist.count, repeatedValue:0)
        let samples = 10000
        for i in 1...samples {
            ++counts[randomIndexFromDistribution(dist)]
        }
        for (index,count) in enumerate(counts) {
            NSLog("\(index)")
            XCTAssertEqualWithAccuracy(Double(count)/Double(samples), dist[index], 0.01, "Index \(index)")
        }
        
        XCTAssertEqual(randomIndexFromDistribution([100]), 0)
        
    }
    
}
