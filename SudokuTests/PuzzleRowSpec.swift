//
//  PuzzleRowSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Quick
import Nimble
@testable import Sudoku

class PuzzleRowSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("Puzle.Row") {
            it("should set isValidRow to true if cell positions are same as the rowIndex") {
                let cells: [Cell] = [
                    .init(position: .init(row: 0, column: 0), state: .solved(1)),
                    .init(position: .init(row: 0, column: 1), state: .solved(3)),
                    .init(position: .init(row: 0, column: 2), state: .solved(2)),
                    .init(position: .init(row: 0, column: 3), state: .solved(4)),
                    .init(position: .init(row: 0, column: 4), state: .solved(6)),
                    .init(position: .init(row: 0, column: 5), state: .solved(5)),
                    .init(position: .init(row: 0, column: 6), state: .solved(7)),
                    .init(position: .init(row: 0, column: 7), state: .solved(8)),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.isValidRow).to(equal(true))
                
            }
            it("should set isValidRow to false if cell positions are different from the rowIndex") {
                let cells: [Cell] = [
                    .init(position: .init(row: 1, column: 0), state: .solved(1)),
                    .init(position: .init(row: 0, column: 1), state: .solved(3)),
                    .init(position: .init(row: 0, column: 2), state: .solved(2)),
                    .init(position: .init(row: 0, column: 3), state: .solved(4)),
                    .init(position: .init(row: 0, column: 4), state: .solved(6)),
                    .init(position: .init(row: 0, column: 5), state: .solved(5)),
                    .init(position: .init(row: 0, column: 6), state: .solved(7)),
                    .init(position: .init(row: 0, column: 7), state: .solved(8)),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.isValidRow).to(equal(false))
                
            }
            
            it("should set isValidSolution to true if cells contain unique solutions") {
                let cells: [Cell] = [
                    .init(position: .init(row: 0, column: 0), state: .solved(1)),
                    .init(position: .init(row: 0, column: 1), state: .solved(3)),
                    .init(position: .init(row: 0, column: 2), state: .solved(2)),
                    .init(position: .init(row: 0, column: 3), state: .solved(4)),
                    .init(position: .init(row: 0, column: 4), state: .solved(6)),
                    .init(position: .init(row: 0, column: 5), state: .solved(5)),
                    .init(position: .init(row: 0, column: 6), state: .solved(7)),
                    .init(position: .init(row: 0, column: 7), state: .solved(8)),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.isValidSolution).to(equal(true))
            }
            
            it("should set isValidSolution to false if cells contain duplicate solutions") {
                let cells: [Cell] = [
                    .init(position: .init(row: 0, column: 0), state: .solved(1)),
                    .init(position: .init(row: 0, column: 1), state: .solved(3)),
                    .init(position: .init(row: 0, column: 2), state: .solved(2)),
                    .init(position: .init(row: 0, column: 3), state: .solved(4)),
                    .init(position: .init(row: 0, column: 4), state: .solved(6)),
                    .init(position: .init(row: 0, column: 5), state: .solved(5)),
                    .init(position: .init(row: 0, column: 6), state: .solved(7)),
                    .init(position: .init(row: 0, column: 7), state: .solved(7)),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.isValidSolution).to(equal(false))
            }
            
            it("should set isOpenSingle to true if row is open single") {
                let cells: [Cell] = [
                    .init(position: .init(row: 0, column: 0), state: .solved(1)),
                    .init(position: .init(row: 0, column: 1), state: .solved(3)),
                    .init(position: .init(row: 0, column: 2), state: .solved(2)),
                    .init(position: .init(row: 0, column: 3), state: .solved(4)),
                    .init(position: .init(row: 0, column: 4), state: .solved(6)),
                    .init(position: .init(row: 0, column: 5), state: .solved(5)),
                    .init(position: .init(row: 0, column: 6), state: .solved(7)),
                    .init(position: .init(row: 0, column: 7), state: .solved(8)),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.isOpenSingle).to(equal(true))
            }
            
            it("should set isOpenSingle to false if row is not open single") {
                let cells: [Cell] = [
                    .init(position: .init(row: 0, column: 0), state: .solved(1)),
                    .init(position: .init(row: 0, column: 1), state: .solved(3)),
                    .init(position: .init(row: 0, column: 2), state: .solved(2)),
                    .init(position: .init(row: 0, column: 3), state: .solved(4)),
                    .init(position: .init(row: 0, column: 4), state: .solved(6)),
                    .init(position: .init(row: 0, column: 5), state: .solved(5)),
                    .init(position: .init(row: 0, column: 6), state: .solved(7)),
                    .init(position: .init(row: 0, column: 7), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.isOpenSingle).to(equal(false))
            }
            
            it("should compute the missing solutions") {
                let cells: [Cell] = [
                    .init(position: .init(row: 0, column: 0), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 1), state: .solved(5)),
                    .init(position: .init(row: 0, column: 2), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 3), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 4), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 5), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 6), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 7), state: .notSolved(candidates: [])),
                    .init(position: .init(row: 0, column: 8), state: .notSolved(candidates: [])),
                ]
                
                let row = Puzzle.Row(index: .init(0), cells: cells)
                
                expect(row.missingSolutions).to(equal([1, 2, 3, 4, 6, 7, 8, 9]))
            }
        }
    }
}
