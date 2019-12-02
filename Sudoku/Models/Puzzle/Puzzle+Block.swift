//
//  Puzzle+Block.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

extension Puzzle {
    public struct Block {
        public static func isSolved(_ x: Self) -> Bool {
            x.cells.filter(\.isNotSolved).count == 0
        }
        
        public static func isNotSolved(_ x: Self) -> Bool {
            x.cells.filter(\.isNotSolved).count != 0
        }
        
        public let position: BlockPosition
        public let cells: [Cell]
        
        public var isSolved: Bool { Self.isSolved(self) }
        
        public var isNotSolved: Bool { Self.isNotSolved(self) }
        
        public var isValidSolution: Bool {
            solvedCells.compactMap(\.state.solution).set.count == solvedCells.compactMap(\.state.solution).count
        }
        
        public var isOpenSingle: Bool {
            unsolvedCells.count == 1
        }
        
        public var hasHiddenSingles: Bool {
            hiddenSingles.count > 0
        }
        
        public var solvedCells: [Cell] {
            cells.filter(\.isSolved)
        }
        
        public var unsolvedCells: [Cell] {
            cells.filter(\.isNotSolved)
        }
        
        public var missingSolutions: [Int] {
            (1...9)
                .map(\.self)
                .set
                .subtracting(cells.compactMap(\.state.solution).set)
                .array
                .sorted()
        }
        
        public var hiddenSingles: [(Int, Cell)] {
            unsolvedCells.reduce([Int: [Cell]]()) { store, cell -> [Int: [Cell]] in
                var store = store
                cell.candidates?.forEach({ candidate in
                    store[candidate] = (store[candidate] ?? []) + [cell]
                })
                return store
            }
            .filter { $0.value.count == 1 }
            .map { ($0.key, $0.value[0]) }
        }
        
        public var nakedPairs: [(Cell, Cell)]? {
            let unsolvedCells = cells
                .filter(\.isNotSolved)
            
            
            return nil
        }
        
        public init(position: BlockPosition, cells: [Cell]) {
            self.position = position
            self.cells = cells
        }
        
        public func contains(solution: Int) -> Bool {
            missingSolutions.contains(solution) == false
        }
        
        public func contains(cell: Cell) -> Bool {
            cells.contains(where: { $0.position == cell.position })
        }
    }
}
