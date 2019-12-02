//
//  VisualElimination.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

extension SolutionStrategy {
    public static var visualElimination: SolutionStrategy {
        .init(name: .visualElimination) { puzzle in
            for cell in puzzle.unsolvedCells {
                let block = puzzle.block(of: cell)
                let candidates = block.missingSolutions
                let rowNeighbors = puzzle.rowNeighbors(of: block)
                let columnNeighbors = puzzle.columnNeighbors(of: block)
                
                for candidate in candidates {
                    let rowSolutions = rowNeighbors.instancesOf(solution: candidate)
                    let columnSolutions = columnNeighbors.instancesOf(solution: candidate)
                    let solutions = rowSolutions + columnSolutions
                    
                    if solutions.count == 4 {
                        let candidateRows = [
                            block.position.row.value * 3,
                            block.position.row.value * 3 + 1,
                            block.position.row.value * 3 + 2
                        ]
                        
                        let solvedRows = rowSolutions
                            .map { $0.position.row.value }
                        
                        let candidateColumns = [
                            block.position.column.value * 3,
                            block.position.column.value * 3 + 1,
                            block.position.column.value * 3 + 2
                        ]
                        
                        let solvedColumns = columnSolutions
                            .map { $0.position.column.value }
                        
                        if let solutionRow = candidateRows.set.subtracting(solvedRows.set).array.first,
                            let solutionColumn = candidateColumns.set.subtracting(solvedColumns.set).array.first {
                         
                            let result = Puzzle
                                .Lenses
                                .state(position: CellPosition(row: solutionRow, column: solutionColumn))
                                .to(.solved(candidate), puzzle)
                            
                            return Transformation(old: puzzle,
                                                  new: result,
                                                  technique: .visualElimination,
                                                  position: CellPosition(row: solutionRow, column: solutionColumn))
                        }
                    }
                }
            }
            
            return nil
        }
    }
}
