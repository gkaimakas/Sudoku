//
//  Technique.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

public struct Technique {
    public let name: Name
    public let apply: (Puzzle) -> Transformation?
    
    public init(name: Name,
                apply: @escaping (Puzzle) -> Transformation?) {
        
        self.name = name
        self.apply = apply
    }
}

extension Technique {
    public enum Name {
        case openSingleRow
        case openSingleColumn
        case openSingleBlock
        case visualElimination
        case nakedSingle
        case hiddenSingleRow
        case nakedPairs
        case nakedTriplets
        case nakedQuads
        case omission
        case hiddenPairs
        case hiddenTriples
        case hiddenQuads
        case xWing
        case swordfish
        case xyWing
        case uniqueRectangle
    }
    
    public struct Transformation {
        let oldPuzzle: Puzzle
        let newPuzzle: Puzzle
        let technique: Technique
        let position: CellPosition
        
        init(old: Puzzle,
             new: Puzzle,
             technique: Technique,
             position: CellPosition) {
            
            self.oldPuzzle = old
            self.newPuzzle = new
            self.technique = technique
            self.position = position
        }
    }
}

extension Technique {
    
    
    public static var nakedPairs: Technique {
        .init(name: .nakedPairs) { _ in nil }
    }
    
    public static var nakedTriplets: Technique {
        .init(name: .nakedTriplets) { _ in nil }
    }
    
    public static var nakedQuads: Technique {
        .init(name: .nakedQuads) { _ in nil }
    }
    
    public static var omission: Technique {
        .init(name: .omission) { _ in nil }
    }
    
    public static var hiddenPairs: Technique {
        .init(name: .hiddenPairs) { _ in nil }
    }
    
    public static var hiddenTriples: Technique {
        .init(name: .hiddenTriples) { _ in nil }
    }
    
    public static var hiddenQuads: Technique {
        .init(name: .hiddenQuads) { _ in nil }
    }
    
    public static var xWing: Technique {
        .init(name: .xWing) { _ in nil }
    }
    
    public static var swordfish: Technique {
        .init(name: .swordfish) { _ in nil }
    }
    
    public static var xyWing: Technique {
        .init(name: .xyWing) { _ in nil }
    }
    
    public static var uniqueRectangle: Technique {
        .init(name: .uniqueRectangle) { _ in nil }
    }
}
