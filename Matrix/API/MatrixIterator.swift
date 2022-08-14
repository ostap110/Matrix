//
//  MatrixIterator.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 14.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

public struct MatrixIterator<Element>: IteratorProtocol {
    let storage: [[Element]]
    private var currentRowIterator: IndexingIterator<[[Element]]>
    private var currentColumnIterator: IndexingIterator<[Element]>?
    
    mutating public func next() -> Element? {
        if currentColumnIterator != nil {
            if let next = currentColumnIterator!.next() {
                return next
            } else {
                if let currentRow = currentRowIterator.next() {
                    currentColumnIterator = currentRow.makeIterator()
                    return currentColumnIterator!.next()
                } else {
                    return nil
                }
            }
        } else {
            return nil
        }
    }
    
    init(storage: [[Element]]) {
        self.storage = storage
        self.currentRowIterator = storage.makeIterator()
        self.currentColumnIterator = currentRowIterator.next()?.makeIterator()
    }
}
