//
//  Position.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

public struct CellPosition {
    public let row: RowIndex
    public let column: ColumnIndex
    
    public init(row: Int, column: Int) {
        self.row = .init(row)
        self.column = .init(column)
    }
    
    public init(row: RowIndex, column: ColumnIndex) {
        self.row = row
        self.column = column
    }
}

extension CellPosition: Equatable {
    public static func ==(lhs: CellPosition, rhs: CellPosition) -> Bool {
        lhs.row == rhs.row
            && lhs.column == rhs.column
    }
}

extension CellPosition: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(column)
    }
}
