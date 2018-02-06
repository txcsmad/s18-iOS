//
//  Operation.swift
//  Calculator
//
//  Created by Jesse Tipton on 2/5/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import Foundation

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    
    func perform(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .multiply:
            return lhs * rhs
        case .divide:
            return lhs / rhs
        }
    }
}
