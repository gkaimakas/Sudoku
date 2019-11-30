//
//  _CellView.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import SwiftUI

struct CellView: View {
    let cell: Cell
    
    var value: String {
        guard let solution = cell.state.solution else {
            return ""
        }
        
        return "\(solution)"
    }
    
    init(cell: Cell) {
        self.cell = cell
    }
    
    init() {
        self.cell = .init(position: .init(row: 0, column: 0), state: .solved(8))
    }
    
    var body: some View {
        GeometryReader { proxy in
            Text(self.value)
                .frame(width: proxy.size.width,
                   height: proxy.size.width,
                   alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .foregroundColor(Style.Colors.Cell.background)
            )
                
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
