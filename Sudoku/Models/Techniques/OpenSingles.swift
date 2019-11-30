//
//  OpenSingles.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//


extension Technique {
    public static var openSingleRow: Technique {
        .init(name: .openSingleRow) { puzzle in
            if let row = puzzle.rows.first(\.isOpenSingle),
                let cell = row.unsolvedCells.first,
                let solution = row.missingSolutions.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), puzzle)
                
                return Transformation(old: puzzle,
                                      new: result,
                                      technique: .openSingleRow,
                                      position: cell.position)
            }
            
            return nil
        }
    }
    public static var openSingleColumn: Technique {
        .init(name: .openSingleColumn) { puzzle in
            
            if let column = puzzle.columns.first(\.isOpenSingle),
                let cell = column.unsolvedCells.first,
                let solution = column.missingSolutions.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), puzzle)
                
                return Transformation(old: puzzle,
                                      new: result,
                                      technique: .openSingleColumn,
                                      position: cell.position)
            }
            
            return nil
        }
    }
    
    public static var openSingleBlock: Technique {
        .init(name: .openSingleBlock) { puzzle in
            
            if let block = puzzle.blocks.first(\.isOpenSingle),
                let cell = block.unsolvedCells.first,
                let solution = block.missingSolutions.first {
                
                let result = Puzzle
                    .Lenses
                    .state(position: cell.position)
                    .to(.solved(solution), puzzle)
                
                return Transformation(old: puzzle,
                                      new: result,
                                      technique: .openSingleBlock,
                                      position: cell.position)
            }
            
            return nil
        }
    }
}
