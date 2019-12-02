//
//  Functional.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

infix operator &&

func &&<A>(_ f: @escaping (A) -> Bool, _ g: @escaping (A) -> Bool) -> ((A) -> Bool) {
    { a in
        f(a) && g(a)
    }
}
