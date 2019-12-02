//
//  Diamond.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

infix operator <>: SingleTypeComposition

func <> <A>(
  f: @escaping (A) -> A,
  g: @escaping (A) -> A)
  -> ((A) -> A) {

  return f >>> g
}

func <> <A>(
  f: @escaping (inout A) -> Void,
  g: @escaping (inout A) -> Void)
  -> ((inout A) -> Void) {

  return { a in
    f(&a)
    g(&a)
  }
}

func |> <A>(a: inout A, f: (inout A) -> Void) -> Void {
  f(&a)
}
