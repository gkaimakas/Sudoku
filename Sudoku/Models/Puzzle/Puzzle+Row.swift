//
//  Puzzle+Row.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

extension Puzzle {
    public struct Row {
        public let index: RowIndex
        public let cells: [Cell]
        
        public var isSolved: Bool {
            solvedCells.count == cells.count
        }
        
        public var isNotSolved: Bool {
            !isSolved
        }
        
        public var isValidRow: Bool {
            cells.map(\.position.row.value)
                .reduce(true, { $0 && $1 == index.value })
        }
        
        public var isValidSolution: Bool {
            solvedCells.compactMap(\.state.solution).set.count == solvedCells.compactMap(\.state.solution).count
        }
        
        public var isOpenSingle: Bool {
            unsolvedCells.count == 1
        }
        
        public var isHiddenSingle: Bool {
            hiddenSingle != nil
        }
        
        public var solvedCells: [Cell] {
            cells.filter(\.isSolved)
        }
        
        public var unsolvedCells: [Cell] {
            cells.filter(\.isNotSolved)
        }
        
        public var hiddenSingle: (Int, Cell)? {
            var store: [Int: [Cell]] = [:]
            unsolvedCells
                .forEach { (cell) in
                    if let candidates = cell.state.candidates {
                        candidates
                            .forEach { candidate in
                                store[candidate] = (store[candidate] ?? []) + [cell]
                        }
                    }
            }
            
            
            
            for (key, cells) in store {
                if cells.count == 1 {
                    return (key, cells[0])
                }
            }
            
            return nil
        }
        
        public var missingSolutions: [Int] {
            (1...9)
                .map(\.self)
                .set
                .subtracting(cells.compactMap(\.state.solution).set)
                .array
                .sorted()
        }
        
        public init(index: RowIndex, cells: [Cell]) {
            self.index = index
            self.cells = cells
        }
        
        public func contains(solution: Int) -> Bool {
            missingSolutions.contains(solution) == false
        }
    }
}
