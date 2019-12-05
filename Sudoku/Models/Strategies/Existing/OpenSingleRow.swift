//
//  OpenSingles.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension SolutionStrategy {
    public static var openSingleRow: SolutionStrategy {
        .init(name: .openSingle(.row)) { puzzle in
            if let row = puzzle.rows.filter(get(\.isOpenSingle)).first,
                let cell = row.unsolvedCells.first,
                let solution = row.missingSolutions.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), puzzle)
                
                return Transformation(old: puzzle,
                                      new: result,
                                      technique: .openSingleRow,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
