//
//  CollectionTestSuite.swift
//  MatrixTests
//
//  Created by Ostap Tyvonovych on 14.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import XCTest
@testable import Matrix

class CollectionTestSuite: XCTestCase {
    func testOneIndexedSubscript() {
        let string = """
         1 8 3 2
        -4 5 6 4
        -7 8 2 70
        """
        let matrix = Matrix<Int>(string)!
        
        // Edge cases:
        XCTAssertEqual(matrix[0], 1)
        XCTAssertEqual(matrix[11], 70)
        
        // Intermediate cases:
        XCTAssertEqual(matrix[2], 3)
        XCTAssertEqual(matrix[3], 2)
        XCTAssertEqual(matrix[4], -4)
    }
}
