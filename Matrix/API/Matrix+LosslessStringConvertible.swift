//
//  Matrix+LosslessStringConvertible.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 13.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

extension Matrix: LosslessStringConvertible where Element: LosslessStringConvertible {
    /// Creates a matrix from a given string.
    ///
    /// It doesn't matter how do you make your string literal, but we recommend to use multi-line string
    /// literal (`"""`) for easier operating with matrices' strings:
    ///
    ///     let correctString = """
    ///     1 2 3
    ///     1 4 2
    ///     5 2 3
    ///     """
    ///     let matrix = Matrix<Int>(string: correctString)
    ///
    ///     let alsoCorrectString = "1 2 3\n1 4 2\n5 2 3"
    ///     let sameMatrix = Matrix<Int>(string: alsoCorrectString)
    ///
    /// It's important to comply with the rules of writing matrix form. If you'll miss one of the elements initialization fails:
    ///
    ///     let spoiledString = """
    ///     1 2 3 4
    ///     1 3   4
    ///     """
    ///     let spoiledMatrix = Matrix<Int>(string: spoiledString)
    ///
    ///     print(spoiledMatrix)
    ///
    ///     // Prints "nil"
    ///
    /// You can only use symbols that are acceptable for initialization ("-", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "\n", "\t",
    /// " " — you can access the set of the allowed characters via `CharacterSet.matrixCharacters`). The last three
    /// symbols are used for separation. If init will get string with foreign characters it will return nil:
    ///
    ///     let foreignCharacters = """
    ///     1 2 g 4
    ///     1 2m msq4
    ///     """
    ///     let matrixWithForeignCharaters = Matrix<Int>(string: foreignCharacters)
    ///
    ///     print(matrixWithForeignCharaters)
    ///
    ///     // Prints "nil"
    ///
    /// Even if you'll use acceptable characters but they will go in unexpected order initialization fails:
    ///
    ///     let invalidForm1 = """
    ///     -121 221 2
    ///       12 3-2 1
    ///     """
    ///     let matrixWithInvalidForm1 = Matrix<Int>(string: invalidForm1)
    ///
    ///     print(matrixWithInvalidForm1)
    ///
    ///     // Prints "nil"
    ///
    ///     let invalidForm2 = """
    ///     0.0 2.1   5.2
    ///     2.4 3.4   2.3
    ///     1.0 7.8.4 3.0
    ///     """
    ///     let matrixWithInvalidForm2 = Matrix<Double>(string: invalidForm2)
    ///
    ///     print(matrixWithInvalidForm2)
    ///
    ///     // Prints "nil"
    ///
    /// You can use spaces, tabs and new line symbols of different sizes. It won't fail initialziation:
    ///
    ///     let stringWithBigSpaces = """
    ///     1 2 3    4
    ///     1  3 5  3
    ///     42  4 4 4
    ///     """
    ///     let matrixWithBigSpaces = Matrix<Int>(string: stringWithBigSpaces)!
    ///
    ///     let stringWithBigTabs = """
    ///     1 2\t\t\t3\t\t4
    ///     1  \t 3\t5\t3
    ///     42\t 4\t4 4\t\t
    ///     """
    ///     let matrixWithBigTabs = Matrix<Int>(string: stringWithBigTabs)!
    ///
    ///     let stringWithExtraNewLineCharacters = """
    ///     1 2 3
    ///
    ///     1 2 3
    ///     1 2 3
    ///     """
    ///     let matrixWithExtraNewLineCharacter = Matrix<Int>(string: stringWithExtraNewLineCharacter)
    ///
    /// String from the `description` property can be used for initializing another matrix:
    ///
    ///     let matrix = Matrix<Int>(array: [[2, 5, 6, 3],
    ///                                      [3, 2, 8, 6],
    ///                                      [2, 0, 6, 4],
    ///                                      [3, 8, 6, 7]])
    ///
    ///     let anotherMatrix = Matrix<Int>(string: matrix.description)!
    ///
    ///     print(anotherMatrix.size)
    ///
    ///     // Prints "(rows: 4, columns: 4)"
    ///
    /// - Parameters:
    ///     - description: A string containing matrix.
    public init?(_ description: String) {
        let stringInitializerService = StringInitializerService<Element>()
        let convertedArray = stringInitializerService.convert(stringToMatrixArray: description)
        
        if let array = convertedArray {
            self.init(array: array)
        } else {
            return nil
        }
    }
}
