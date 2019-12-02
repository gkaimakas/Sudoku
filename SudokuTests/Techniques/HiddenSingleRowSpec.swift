//
//  HiddenSingleRowSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sudoku

class HiddenSingleRowSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("HiddenSingleRow") {
            it("should change the state of a cell using hidden single row") {
                let input = "...8.2..1.9.6.1.4.5.......6.23...86.87..6..92659...17.3.....4.9.4.7.361....4.6..."
                let expectedOutput = "...8.2..1.9.6.1.4.5.......6.23...86.87..6..92659...17.3.7...4.9.4.7.361....4.6..."
                
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = SolutionStrategy.hiddenSingleRow.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                if let result = result {
                    expect(result.technique.name).to(equal(.hiddenSingle(.row)))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 6, column: 2)))
                }
            }
        }
    }
}
