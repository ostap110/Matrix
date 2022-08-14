//
//  Matrix+Collection.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 14.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

extension Matrix: Collection {
    public typealias Index = Int
    
    public var startIndex: Index {
        return 0
    }
    public var endIndex: Index {
        return size.rows * size.columns
    }
    
    public subscript(_ position: Index) -> Element {
        guard indices.contains(position) else {
            fatalError("Index out of range")
        }
        let rowIndex = position / size.columns
        let columnIndex = position % size.columns
        return self[rowIndex, columnIndex]
    }
    
    public func index(after i: Index) -> Index {
        return i + 1
    }
}
