//
//  ContentView.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PuzzleView()
            .background(Style.Colors.background)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            ContentView()
                .environment(\.colorScheme, scheme)
        }
        
        
    }
}
