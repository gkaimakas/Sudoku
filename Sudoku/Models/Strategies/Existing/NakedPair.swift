//
//  NakedPair.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension SolutionStrategy {
    static var nakedPairBlock: SolutionStrategy {
        .init(name: .nakedPair(.block)) { puzzle in
            if let block = puzzle.blocks.filter ( Block.isNotSolved && hasNakedPair ).first {
                
            }
            return nil
        }
    }
}

private func isNotSolved(_ block: Block) -> Bool {
    block.isNotSolved
}

private func hasNakedPair(_ block: Block) -> Bool {
    block.nakedPairs != nil
}
