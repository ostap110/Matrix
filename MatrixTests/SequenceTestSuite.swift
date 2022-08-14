//
//  SequenceTestSuite.swift
//  MatrixTests
//
//  Created by Ostap Tyvonovych on 14.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//


import XCTest
@testable import Matrix

class SequenceTestSuite: XCTestCase {
    func testSquareMatrixIteration() {
        let string = """
        1 8 3
        -4 5 6
        -7 8 2
        """
        let matrix = Matrix<Int>(string)!
        var matrixElementsOneByOne = [Int]()
        let resultArray = [1, 8, 3, -4, 5, 6, -7, 8, 2]
        
        for element in matrix {
            matrixElementsOneByOne.append(element)
        }
        
        XCTAssertEqual(matrixElementsOneByOne, resultArray)
    }
    
    func testNonSquareMatrixIteration() {
        let string = """
         1 8 3 10
        -4 5 6 -9
        -7 8 2 0
        """
        let matrix = Matrix<Int>(string)!
        var matrixElementsOneByOne = [Int]()
        let resultArray = [1, 8, 3, 10, -4, 5, 6, -9, -7, 8, 2, 0]
        
        for element in matrix {
            matrixElementsOneByOne.append(element)
        }
        
        XCTAssertEqual(matrixElementsOneByOne, resultArray)
    }
    
    func testSignleElementMatrixIteration() {
        let string = "1"
        let matrix = Matrix<Int>(string)!
        var matrixElementsOneByOne = [Int]()
        let resultArray = [1]
        
        for element in matrix {
            matrixElementsOneByOne.append(element)
        }
        
        XCTAssertEqual(matrixElementsOneByOne, resultArray)
    }
}
