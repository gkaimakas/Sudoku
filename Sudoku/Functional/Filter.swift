//
//  Filter.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

func filter<A>(x: [A], f: @escaping (A) -> Bool) -> [A] {
    x.filter{ f($0) }
}
