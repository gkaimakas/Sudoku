//
//  Array.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    var set: Set<Element> {
        Set(self)
    }
}

extension Array where Element == Block {
    func instancesOf(solution: Int) -> [Cell] {
        flatMap { $0.solvedCells }
            .filter { $0.state.solution == solution }
    }
}
