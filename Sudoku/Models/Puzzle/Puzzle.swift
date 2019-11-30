//
//  Puzzle.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

public struct Puzzle {
    static func decode(raw: String) -> [Cell] {
        raw
            .components(maxLength: 9)
            .enumerated()
            .flatMap { (rowIndex, rowValues) -> [Cell] in
                rowValues
                    .map(String.init >>> Int.init)
                    .enumerated()
                    .map { columnIndex, value -> Cell in
                        .init(position: .init(row: rowIndex, column: columnIndex),
                              state: .decode(raw: value))
                }
                
        }
    }
    
    let cells: [Cell]
    
    var rows: [Row] {
        cells.map(\.position.row.value)
            .set
            .array
            .sorted()
            .map { row -> Row in
                let cells = self.cells.filter { $0.position.row == row }
                return Row(index: .init(row), cells: cells)
        }
    }
    
    var columns: [Column] {
        cells.map(\.position.column.value)
            .set
            .array
            .sorted()
            .map { column -> Column in
                let cells = self.cells.filter { $0.position.column == column }
                return Column(index: .init(column), cells: cells)
        }
    }
    
    var blocks: [Block] {
        var result: [Block] = []
         for blockRow in 0..<3 {
             let rowRange = (blockRow*3)..<(blockRow*3 + 3)
             
             for blockColumn in 0..<3 {
                 let columnRange = (blockColumn*3)..<(blockColumn*3 + 3)
                 
                 var cells: [Cell] = []
                 
                 for rowIndex in rowRange {
                     for columnIndex in columnRange {
                        let cellIndex = rowIndex * 9 + columnIndex
                        cells.append(self.cells[cellIndex])
                     }
                 }
                 
                result.append(.init(position: .init(row: blockRow,
                                                    column: blockColumn),
                                    cells: cells))
             }
         }
        
        return result
    }
    
    init(raw: String) {
        assert(raw.count == 81)
        cells = Self.decode(raw: raw)
            .sorted(by: { $0.position.order < $1.position.order })
    }
    
    init(cells: [Cell]) {
        self.cells = cells
            .sorted(by: { $0.position.order < $1.position.order })
    }
    
    func cell(at position: CellPosition) -> Cell {
        guard let result = cells.first(where: { $0.position == position }) else {
            fatalError("Position(row: \(position.row), column: \(position.column) out of range")
        }
        
        return result
    }
    
    func block(at position: BlockPosition) -> Block {
        guard let result = blocks.first(where: { $0.position == position }) else {
            fatalError("Position(row: \(position.row), column: \(position.column) out of range")
        }
        
        return result
    }
    
    func block(of cell: Cell) -> Block {
        guard let block = blocks.first(where: { $0.contains(cell: cell) }) else {
            fatalError("Cell: \(cell) not found")
        }
        
        return block
    }
    
    func instancesOf(solution: Int) -> Int {
        cells
            .filter(\.isSolved)
            .compactMap(\.state.solution)
            .filter { $0 == solution }
            .count
    }
}

extension Puzzle: Equatable {
    public static func ==(lhs: Puzzle, rhs: Puzzle) -> Bool {
        lhs.cells == rhs.cells
    }
}

extension Puzzle: CustomStringConvertible {
    public var description: String {
        cells
            .map { $0.state.solution != nil ? "\($0.state.solution!)" : "." }
            .joined()
    }
}
