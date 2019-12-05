//
//  ReverseChain.swift
//  Sudoku
//
//  Created by George Kaimakas on 5/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

infix operator <<<: BackwardsComposition

func <<< <A, B, C>(g: @escaping (B) -> C, f: @escaping (A) -> B) -> (A) -> C {
  return { x in
    g(f(x))
  }
}
