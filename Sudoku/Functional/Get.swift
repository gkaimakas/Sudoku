//
//  Get.swift
//  Sudoku
//
//  Created by George Kaimakas on 5/12/19.
//  Copyright © 2019 George Kaimakas. All rights reserved.
//

func get<Root, Value>(_ keyPath: KeyPath<Root, Value>) ->  (Root) -> Value {
    return { root in
        root[keyPath: keyPath]
    }
}
