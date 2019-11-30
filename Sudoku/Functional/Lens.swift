//
//  Lens.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

public struct Lens<A, B> {
    let from: (A) -> B
    let to: (B, A) -> A
}

func >>><A,B,C>(lhs: Lens<A,B>, rhs: Lens<B,C>) -> Lens<A,C> {
    .init(from: { rhs.from(lhs.from($0)) }) { (c, a) in
        lhs.to(rhs.to(c,lhs.from(a)), a)
    }
}
