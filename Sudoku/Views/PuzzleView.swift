//
//  PuzzleView.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import SwiftUI

struct PuzzleView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 2) {
                HStack(alignment: .center, spacing: 2) {
                    BlockView()
                    BlockView()
                    BlockView()
                }
                HStack(alignment: .center, spacing: 2) {
                    BlockView()
                    BlockView()
                    BlockView()
                }
                HStack(alignment: .center, spacing: 2) {
                    BlockView()
                    BlockView()
                    BlockView()
                }
            }
            .frame(width: proxy.size.min,
                   height: proxy.size.min,
                   alignment: .center)
        }
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView()
    }
}
