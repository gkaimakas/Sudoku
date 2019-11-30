//
//  Row.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

public struct RowIndex {
    
    public let value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
}

extension RowIndex: Equatable {
    public static func ==(lhs: RowIndex, rhs: RowIndex) -> Bool {
        lhs.value == rhs.value
    }
}

extension RowIndex: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
