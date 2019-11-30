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
            VStack {
                HStack {
                    BlockView()
                    BlockView()
                    BlockView()
                }
                HStack {
                    BlockView()
                    BlockView()
                    BlockView()
                }
                HStack {
                    BlockView()
                    BlockView()
                    BlockView()
                }
            }
            .frame(width: proxy.size.width,
                   height: proxy.size.width,
                   alignment: .center)
        }
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView()
    }
}
