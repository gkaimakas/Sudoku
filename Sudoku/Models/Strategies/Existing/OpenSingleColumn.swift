//
//  OpenSingleColumn.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension Technique {
    public static var openSingleColumn: Technique {
        .init(name: .openSingle(.column)) { puzzle in
            
            if let column = puzzle.columns.first(\.isOpenSingle),
                let cell = column.unsolvedCells.first,
                let solution = column.missingSolutions.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), puzzle)
                
                return Transformation(old: puzzle,
                                      new: result,
                                      technique: .openSingleColumn,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
