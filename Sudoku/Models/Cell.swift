//
//  Cell.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

public struct Cell {
    public let position: CellPosition
    public let state: State
    
    public let isSolved: Bool
    public let isNotSolved: Bool
    
    init(position: CellPosition, state: State) {
        self.position = position
        self.state = state
        self.isSolved = state.isSolved
        self.isNotSolved = !state.isSolved
    }
}

public extension Cell {
    enum State {
        case solved(Int)
        case notSolved
        
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
    }
}

extension Cell.State {
    static func decode(raw: Int?) -> Self {
        switch raw {
        case let .some(value):
            return .solved(value)
        case .none:
            return .notSolved
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
