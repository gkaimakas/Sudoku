//
//  Column.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

public struct ColumnIndex {
    public static func ==(lhs: ColumnIndex, rhs: Int) -> Bool {
        lhs.value == rhs
    }
    
    public static func ==(lhs: Int, rhs: ColumnIndex) -> Bool {
        lhs == rhs.value
    }
    
    public let value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
}

extension ColumnIndex: Equatable {
    public static func ==(lhs: ColumnIndex, rhs: ColumnIndex) -> Bool {
        lhs.value == rhs.value
    }
}

extension ColumnIndex: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
