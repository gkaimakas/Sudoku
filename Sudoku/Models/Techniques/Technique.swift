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
    public let apply: (Puzzle) -> Void
    
    public init(name: Name,
                apply: @escaping (Puzzle) -> Void) {
        
        self.name = name
        self.apply = apply
    }
}

extension Technique {
    public enum Name {
        case openSingles
        case visualElimination
        case loneSingles
        case hiddenSingles
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
}

extension Technique {
    public static var openSignles: Technique {
        .init(name: .openSingles) { puzzle in
            
        }
    }
    
    public static var visualElimination: Technique {
        .init(name: .visualElimination) { _ in }
    }
    
    public static var loneSingles: Technique {
        .init(name: .loneSingles) { _ in }
    }
    
    public static var hiddenSingles: Technique {
        .init(name: .hiddenSingles) { _ in }
    }
    
    public static var nakedPairs: Technique {
        .init(name: .nakedPairs) { _ in }
    }
    
    public static var nakedTriplets: Technique {
        .init(name: .nakedTriplets) { _ in }
    }
    
    public static var nakedQuads: Technique {
        .init(name: .nakedQuads) { _ in }
    }
    
    public static var omission: Technique {
        .init(name: .omission) { _ in }
    }
    
    public static var hiddenPairs: Technique {
        .init(name: .hiddenPairs) { _ in }
    }
    
    public static var hiddenTriples: Technique {
        .init(name: .hiddenTriples) { _ in }
    }
    
    public static var hiddenQuads: Technique {
        .init(name: .hiddenQuads) { _ in }
    }
    
    public static var xWing: Technique {
        .init(name: .xWing) { _ in }
    }
    
    public static var swordfish: Technique {
        .init(name: .swordfish) { _ in }
    }
    
    public static var xyWing: Technique {
        .init(name: .xyWing) { _ in }
    }
    
    public static var uniqueRectangle: Technique {
        .init(name: .uniqueRectangle) { _ in }
    }
}
