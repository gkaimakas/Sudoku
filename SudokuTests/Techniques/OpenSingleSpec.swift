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

class OpenSingleSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("OpenSingleRow") {
            it("should change the state of a cell if it is in an open single row") {
                let input = "1234567894.67891237.91.3456912345678345678912678912345234567891567891234891234567"
                let expectedOutput = "1234567894567891237.91.3456912345678345678912678912345234567891567891234891234567"
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = Technique.openSingleRow.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                if let result = result {
                    expect(result.technique.name).to(equal(.openSingleRow))
                    expect(result.oldPuzzle).to(equal(inputPuzzle))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 1, column: 1)))
                }
            }
        }
        
        describe("OpenSingleColumn"){
            it("should change the state of a cell if it is in an open single column") {
                let input = "12.45678.4567891237.912345.9.234567.345678912678912345234567891567891234891234567"
                let expectedOutput = "12345678.4567891237.912345.9.234567.345678912678912345234567891567891234891234567"
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = Technique.openSingleColumn.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                expect(inputPuzzle.description).to(equal(input))
                if let result = result {
                    expect(result.technique.name).to(equal(.openSingleColumn))
                    expect(result.oldPuzzle).to(equal(inputPuzzle))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 0, column: 2)))
                }
                
            }
        }
        
        describe("OpenSingleBlock") {
            it("should change the state of a cell if it is in an open single block") {
                let input = "12.45678.4567891.37891234..9..34567.345678912678912345234567891567891234891234567"
                let expectedOutput = "12345678.4567891.37891234..9..34567.345678912678912345234567891567891234891234567"
                let inputPuzzle = Puzzle.init(raw: input)
                
                let result = Technique.openSingleBlock.apply(inputPuzzle)
                
                expect(result).toNot(beNil())
                expect(inputPuzzle.description).to(equal(input))
                if let result = result {
                    expect(result.technique.name).to(equal(.openSingleBlock))
                    expect(result.oldPuzzle).to(equal(inputPuzzle))
                    expect(result.newPuzzle.description).to(equal(expectedOutput))
                    expect(result.position).to(equal(CellPosition(row: 0, column: 2)))
                }
            }
        }
    }
}
