//
//  Cell.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

public struct Cell {
    public static func isSolved(_ x: Self) -> Bool {
        x.state.isSolved
    }
    
    public static func isNotSolved(_ x: Self) -> Bool {
        !x.state.isSolved
    }
    
    public static func isLoneSingle(_ x: Self) -> Bool {
        x.state.candidates?.count == 1
    }
    
    public let position: CellPosition
    public let state: State
    
    public var solution: Int? { self.state.solution }
    public var candidates: [Int]? { self.state.candidates }
    
    public var isSolved: Bool { Self.isSolved(self) }
    public var isNotSolved: Bool { Self.isNotSolved(self) }
    public var isLoneSingle: Bool { Self.isLoneSingle(self) }
    
    init(position: CellPosition,
         state: State) {
        
        self.position = position
        self.state = state
    }
}

public extension Cell {
    enum State {
        case solved(Int)
        case notSolved(candidates: [Int]?)
        
        var isSolved: Bool {
            solution != nil
        }
        
        var solution: Int? {
            switch self {
            case let .solved(value):
                return value
            case _:
                return nil
            }
        }
        
        var candidates: [Int]? {
            switch self {
            case let .notSolved(candidates):
                return candidates?.sorted()
            case _:
                return nil
            }
        }
    }
}

extension Cell.State {
    static func decode(raw: Int?) -> Self {
        switch raw {
        case let .some(value):
            return .solved(value)
        case .none:
            return .notSolved(candidates: nil)
        }
    }
}

extension Cell.State: Equatable {
    public static func ==(lhs: Cell.State, rhs: Cell.State) -> Bool {
        switch (lhs, rhs) {
        case (let .solved(a), let .solved(b)):
            return a == b
        case _:
            return false
        }
    }
}

extension Cell.State: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(solution)
    }
}

extension Cell: Equatable {
    public static func ==(lhs: Cell, rhs: Cell) -> Bool {
        lhs.position == rhs.position
            && lhs.state == rhs.state
    }
}

extension Cell {
    enum Lenses {
        static let state = Lens<Cell, Cell.State>(from: { $0.state },
                                                  to: { Cell(position: $1.position, state: $0) })
    }
}
