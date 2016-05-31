//
//  ArrayExtensions.swift
//  SymSim
//
//  Created by Russ Bishop on 5/31/16.
//  Copyright © 2016 Russ Bishop. All rights reserved.
//

import Foundation

extension Array {
    public subscript(ifExists index: Int) -> Element? {
        get {
            guard index >= self.startIndex && index < self.endIndex else { return nil }
            return self[index]
        }
    }
}
