//
//  HiddenSingleColumnSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Sudoku

class HiddenSingleColumnSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("HiddenSingleColumn") {
            it("should change the state of a cell using hidden single column") {
                let input = "..368.5...4.572.9...79.3...47.....68....6....63.....12.641.8....1.796.4...9.2.6.1"
                let expectedOutput = "..368.5...46572.9...79.3...47.....68....6....63.....12.641.8....1.796.4...9.2.6.1"
                
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = Technique.hiddenSingleColumn.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                if let result = result {
                    expect(result.technique.name).to(equal(.hiddenSingleColumn))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 1, column: 2)))
                }
            }
        }
    }
}
