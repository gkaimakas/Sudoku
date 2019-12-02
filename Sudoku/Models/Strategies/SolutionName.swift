//
//  TechniqueName.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

public enum SolutionName {
    case openSingle(TechniqueContainer)
    case visualElimination
    case hiddenSingle(TechniqueContainer)
    case nakedSingle
    case nakedPair(TechniqueContainer)
    //        case nakedTriplet
    //        case nakedQuad
    //        case omission
    //        case hiddenPair
    //        case hiddenTriple
    //        case hiddenQuad
    //        case xWing
    //        case swordfish
    //        case xyWing
    //        case uniqueRectangle
}

extension SolutionName: Equatable {
    public static func ==(lhs: SolutionName, rhs: SolutionName) -> Bool {
        lhs.description == rhs.description
    }
}

extension SolutionName: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .openSingle(value):
            return "openSingle(\(value.rawValue))"
        case .visualElimination:
            return "visualElimination"
        case .nakedSingle:
            return "nakedSingle"
        case let .hiddenSingle(value):
            return "hiddenSingle(\(value.rawValue))"
        case let .nakedPair(value):
            return "nakedPair(\(value))"
            
        }
    }
}

extension SolutionName: CustomDebugStringConvertible {
    public var debugDescription: String { description }
}
