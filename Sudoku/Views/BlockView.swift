//
//  BlockView.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import SwiftUI

struct BlockView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 2) {
                HStack(alignment: .center, spacing: 2) {
                    CellView()
                    CellView()
                    CellView()
                }
                HStack(alignment: .center, spacing: 2) {
                    CellView()
                    CellView()
                    CellView()
                }
                HStack(alignment: .center, spacing: 2) {
                    CellView()
                    CellView()
                    CellView()
                }
            }
            .frame(width: proxy.size.width,
                   height: proxy.size.width,
                   alignment: .center)
        }
    }
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView()
    }
}
