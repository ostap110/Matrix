//
//  CharacterSet+matrix.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 13.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

public extension CharacterSet {
    // Set of valid characters for matrix:
    static let matrix = CharacterSet(charactersIn: "-0123456789.\n\t ")
}
