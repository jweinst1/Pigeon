//
//  Infixops.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/7/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//file that stores cached functions for evaluating infix operators

class InFixOps {
    static let math = [
        "+":{(a:PigWrapper, b:PigWrapper) -> PigWrapper in a + b},
        "-":{(a:PigWrapper, b:PigWrapper) -> PigWrapper in a - b},
        "*":{(a:PigWrapper, b:PigWrapper) -> PigWrapper in a * b},
        "/":{(a:PigWrapper, b:PigWrapper) -> PigWrapper in a / b},
        "%":{(a:PigWrapper, b:PigWrapper) -> PigWrapper in a % b}
    ]
}