//
//  Curry.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

public func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> ((B) -> (C)) {
    { a in { b in f(a, b) } }
}

public func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (A) -> ((B) -> ((C) -> D)) {
    { a in { b in { c in f(a, b, c) } } }
}
