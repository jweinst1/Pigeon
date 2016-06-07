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
    //static implementation of infix functions
    static func add(a:PigWrapper, b:PigWrapper) -> PigWrapper {
        let newpig = PigWrapper(val:PigValue())
        newpig.pig.int = a.pig.int! + b.pig.int!
        return newpig
    }
    static func sub(a:PigWrapper, b:PigWrapper) -> PigWrapper {
        let newpig = PigWrapper(val:PigValue())
        newpig.pig.int = a.pig.int! - b.pig.int!
        return newpig
    }
    static func mul(a:PigWrapper, b:PigWrapper) -> PigWrapper {
        let newpig = PigWrapper(val:PigValue())
        newpig.pig.int = a.pig.int! * b.pig.int!
        return newpig
    }
    static func div(a:PigWrapper, b:PigWrapper) -> PigWrapper {
        let newpig = PigWrapper(val:PigValue())
        newpig.pig.int = a.pig.int! / b.pig.int!
        return newpig
    }
    static func rem(a:PigWrapper, b:PigWrapper) -> PigWrapper {
        let newpig = PigWrapper(val:PigValue())
        newpig.pig.int = a.pig.int! % b.pig.int!
        return newpig
    }
    //cached storage of infix functions
    static let ops = [
        "+":InFixOps.add,
        "-":InFixOps.sub,
        "*":InFixOps.mul,
        "/":InFixOps.div,
        "%":InFixOps.rem
    ]
}