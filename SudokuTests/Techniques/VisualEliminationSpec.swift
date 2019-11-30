//
//  VisualEliminationSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sudoku

class VisualEliminationSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("VisualElimination") {
            it("should change the state of a cell using visual elimination") {
                let input = "..6.3.7.8.3......12.....6..1..35...6.79.4.15.5...17..4..2.....76......8.4.7.6.2.."
                let expectedOutput = "..6.3.7.8.3......12.....6..1..35..76.79.4.15.5...17..4..2.....76......8.4.7.6.2.."
                
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = Technique.visualElimination.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                if let result = result {
                    expect(result.technique.name).to(equal(.visualElimination))
                    expect(result.oldPuzzle).to(equal(inputPuzzle))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 3, column: 7)))
                }
            }
        }
    }
}
