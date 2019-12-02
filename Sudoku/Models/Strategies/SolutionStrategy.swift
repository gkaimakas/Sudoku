//
//  Technique.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

public struct SolutionStrategy {
    public let name: SolutionName
    public let apply: (Puzzle) -> Transformation?
    
    public init(name: SolutionName,
                apply: @escaping (Puzzle) -> Transformation?) {
        
        self.name = name
        self.apply = apply
    }
}

extension SolutionStrategy {
    
    public struct Transformation {
        let oldPuzzle: Puzzle
        let newPuzzle: Puzzle
        let technique: SolutionStrategy
        let position: CellPosition
        
        init(old: Puzzle,
             new: Puzzle,
             technique: SolutionStrategy,
             position: CellPosition) {
            
            self.oldPuzzle = old
            self.newPuzzle = new
            self.technique = technique
            self.position = position
        }
    }
}


