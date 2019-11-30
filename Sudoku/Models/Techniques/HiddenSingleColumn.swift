//
//  HiddenSingleColumn.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension Technique {
    public static var hiddenSingleColumn: Technique {
        .init(name: .hiddenSingleColumn) { puzzle in
            let updatedPuzzle = puzzle.updateCandidates()
            
            if let (solution, cell) = updatedPuzzle.columns.filter(\.isNotSolved).filter(\.isHiddenSingle).first?.hiddenSingle {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), updatedPuzzle)
                
                return Transformation(old: updatedPuzzle,
                                      new: result.updateCandidates(),
                                      technique: .hiddenSingleColumn,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
