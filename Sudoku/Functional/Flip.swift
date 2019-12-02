//
//  Flip.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
  return { b in { a in f(a)(b) } }
}
