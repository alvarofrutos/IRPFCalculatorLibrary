//
//  IRPFCalculatorLibraryTests.swift
//  IRPFCalculatorLibraryTests
//
//  Created by Álvaro Frutos Gutiérrez on 30/5/16.
//  Copyright © 2016 Álvaro Frutos Gutiérrez. All rights reserved.
//

import XCTest
@testable import IRPFCalculatorLibrary

class IRPFCalculatorLibraryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCaseBasic1() {
        // Functional test case 1.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let data : PersonalData = PersonalData()
        
        // Set personal data
        data.earnings = 40000
        
        // Set calculation type
        let type : CalculationType = .IRPF2016
        
        
        // Calculate
        let calculation = Calculation(personalData: data, type: type)
        
        calculation.calculate()
        
        // Check results
        XCTAssertEqual(calculation.retentionValue, 8704, "Test Case Basic 1: Retention value")
        XCTAssertEqual(calculation.retentionType, 21.76, "Test Case Basic 1: Retention type")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
