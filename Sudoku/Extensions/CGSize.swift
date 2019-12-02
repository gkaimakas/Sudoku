//
//  CGSize.swift
//  Sudoku
//
//  Created by George Kaimakas on 2/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

import SwiftUI

public extension CGSize {
    static func min(_ size: Self) -> CGFloat {
        Swift.min(size.width, size.height)
    }
    
    var min: CGFloat { CGSize.min(self) }
}
