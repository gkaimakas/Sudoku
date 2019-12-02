//
//  NakedPair.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension Technique {
    static var nakedPairBlock: Technique {
        .init(name: .nakedPair(.block)) { puzzle in
            if let block = puzzle.blocks.filter ( isNotSolved && hasNakedPair ).first {
                
            }
            return nil
        }
    }
}

private func isNotSolved(_ block: Puzzle.Block) -> Bool {
    block.isNotSolved
}

private func hasNakedPair(_ block: Puzzle.Block) -> Bool {
    block.nakedPairs != nil
}
