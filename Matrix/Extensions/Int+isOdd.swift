//
//  Int+isOdd.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 13.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

extension Int {
    var isOdd: Bool {
        return (self & 1) == 1
    }
}
