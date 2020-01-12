//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Goad, William (PAH) on 11/01/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {
    
    func testCarGetStatsAsPerPropertyValues() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 100, acceleration: 7.5,
        handling: 3)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 100
        Acceleration: 7.5
        Handling: 3
        """
        
        //act
        let actual = car.displayStats()
        //assert
        XCTAssertEqual(actual, expected)
    }
}
