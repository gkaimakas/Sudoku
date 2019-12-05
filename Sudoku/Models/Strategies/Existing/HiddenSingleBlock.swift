//
//  HiddenSingleBlock.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension SolutionStrategy {
    public static var hiddenSingleBlock: SolutionStrategy {
        .init(name: .hiddenSingle(.block)) { puzzle in
            let updatedPuzzle = puzzle.updateCandidates()
            
            if let (solution, cell) = updatedPuzzle.blocks.filter(get(\.isNotSolved)).filter(get(\.hasHiddenSingles)).first?.hiddenSingles.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), updatedPuzzle)
                
                return Transformation(old: updatedPuzzle,
                                      new: result.updateCandidates(),
                                      technique: .hiddenSingleBlock,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
