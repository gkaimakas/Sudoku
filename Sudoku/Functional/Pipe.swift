//
//  Pipe.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

infix operator |>: ForwardApplication

public func |> <A, B>(a: A, f: (A) -> B) -> B {
  return f(a)
}
