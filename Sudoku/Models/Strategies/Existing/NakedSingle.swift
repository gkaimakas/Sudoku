//
//  LoneSingles.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension SolutionStrategy {
    public static var nakedSingle: SolutionStrategy {
        .init(name: .nakedSingle) { puzzle in
            let updatedPuzzle = puzzle.updateCandidates()
            let loneSingles = updatedPuzzle.unsolvedCells.filter(\.isLoneSingle)
            
            if let cell = loneSingles.first,
                let solution = cell.state.candidates?.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), updatedPuzzle)
                
                return Transformation(old: updatedPuzzle,
                                      new: result.updateCandidates(),
                                      technique: .nakedSingle,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
