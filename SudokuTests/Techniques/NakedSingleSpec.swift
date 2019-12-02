//
//  LoneSinglesSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sudoku

class LoneSinglesSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("NakedSingle") {
            it("should change the state of a cell using lone singles") {
                let input = "412736589......1.6568.1.37....85.21.1.......8.87.9.....3..7.8658...........9.84.1"
                let expectedOutput = "412736589......1.6568.1.37....85.21.1.......8.87.9.6...3..7.8658...........9.84.1"
                
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = SolutionStrategy.nakedSingle.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                if let result = result {
                    expect(result.technique.name).to(equal(.nakedSingle))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 5, column: 6)))
                }
            }
        }
    }
}
