//
//  Row.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

public struct RowIndex {
    public static func ==(lhs: RowIndex, rhs: Int) -> Bool {
        lhs.value == rhs
    }
    
    public static func ==(lhs: Int, rhs: RowIndex) -> Bool {
        lhs == rhs.value
    }
    
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
