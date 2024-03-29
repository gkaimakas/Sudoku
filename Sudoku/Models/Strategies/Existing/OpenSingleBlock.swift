//
//  OpenSingleBlock.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension SolutionStrategy {
    public static var openSingleBlock: SolutionStrategy {
        .init(name: .openSingle(.block)) { puzzle in
            
            if let block = puzzle.blocks.filter(get(\.isOpenSingle)).first,
                let cell = block.unsolvedCells.first,
                let solution = block.missingSolutions.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), puzzle)
                
                return Transformation(old: puzzle,
                                      new: result,
                                      technique: .openSingleBlock,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
