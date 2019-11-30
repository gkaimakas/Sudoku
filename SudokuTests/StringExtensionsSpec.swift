//
//  StringExtensionsSpec.swift
//  SudokuTests
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import Quick
import Nimble
@testable import Sudoku

class StringExtensionsSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("components(maxLength:)") {
            it("should break a string into parts with length") {
                let seed = ".9.3....6..4..7..3....45.9..49.5.1......1.6..17.9.4...........7......8.536......."
                let result = seed.components(maxLength: 3)
                
                expect(result.count).to(equal(27))
                expect(result.joined()).to(equal(seed))
                result.forEach { value in
                    expect(value.count).to(equal(3))
                }
            }
        }
    }
}
