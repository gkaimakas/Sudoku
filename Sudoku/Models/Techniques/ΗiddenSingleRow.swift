//
//  HiddenSingle.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension Technique {
    public static var hiddenSingleRow: Technique {
        .init(name: .hiddenSingleRow) { puzzle in
            let updatedPuzzle = puzzle.updateCandidates()
            
            if let (solution, cell) = updatedPuzzle.rows.filter(\.isNotSolved).filter(\.isHiddenSingle).first?.hiddenSingle {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), updatedPuzzle)
                
                return Transformation(old: updatedPuzzle,
                                      new: result.updateCandidates(),
                                      technique: .hiddenSingleRow,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
