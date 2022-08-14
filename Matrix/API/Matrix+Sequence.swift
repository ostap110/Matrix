//
//  Matrix+Sequence.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 14.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

extension Matrix: Sequence {
    public func makeIterator() -> MatrixIterator<Element> {
        return MatrixIterator(storage: storage)
    }
}
