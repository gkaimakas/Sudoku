//
//  Puzzle+Lenses.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

extension Puzzle {
    enum Lenses {
        static func cell(position: CellPosition) -> Lens<Puzzle, Cell> {
            Lens<Puzzle, Cell>(from: { $0.cell(at: position) }) { (cell, puzzle) -> Puzzle in
                .init(cells: puzzle.cells.filter { $0.position != position } + [cell])
            }
        }
        
        static func state(position: CellPosition) -> Lens<Puzzle, Cell.State> {
            cell(position:position) >>> Cell.Lenses.state
        }
    }
}
