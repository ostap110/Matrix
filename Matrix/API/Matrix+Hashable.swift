//
//  Matrix+Hashable.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 13.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

extension Matrix: Hashable where Element: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(storage)
    }
}
