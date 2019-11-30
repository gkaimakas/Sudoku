//
//  Style.swift
//  Sudoku
//
//  Created by George Kaimakas on 30/11/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import SwiftUI

public struct Style { }

extension Style {
    public struct Colors {
        public static let background = Color("background", bundle: nil)
    }
}

extension Style.Colors {
    public struct Cell {
        public static let background = Color("backgroundCell")
    }
}
