//
//  SudokuParserSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Quick
import Nimble
@testable import Sudoku

class SudokuParserSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("SudokuParser") {
            it("should parse a single line sudoku to a puzzle") {
                let seed = ".9.3....6..4..7..3....45.9..49.5.1......1.6..17.9.4...........7......8.536......."
                
                let puzzle = Puzzle(raw: seed)
                
                expect(puzzle.cells.count).to(equal(81))
                expect(puzzle.rows.count).to(equal(9))
                expect(puzzle.columns.count).to(equal(9))
            }
        }
    }
}
