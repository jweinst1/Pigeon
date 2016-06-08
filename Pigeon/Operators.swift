//
//  Operators.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/7/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation
//operator overloads for pigwrapper and pigvalues
func + (a:PigWrapper, b:PigWrapper) -> PigWrapper {
    let newpig = PigWrapper(val: PigValue())
    newpig.pig.int = a.pig.int! + b.pig.int!
    return newpig
}

func - (a:PigWrapper, b:PigWrapper) -> PigWrapper {
    let newpig = PigWrapper(val: PigValue())
    newpig.pig.int = a.pig.int! - b.pig.int!
    return newpig
}

func * (a:PigWrapper, b:PigWrapper) -> PigWrapper {
    let newpig = PigWrapper(val: PigValue())
    newpig.pig.int = a.pig.int! * b.pig.int!
    return newpig
}

func / (a:PigWrapper, b:PigWrapper) -> PigWrapper {
    let newpig = PigWrapper(val: PigValue())
    newpig.pig.int = a.pig.int! / b.pig.int!
    return newpig
}
func % (a:PigWrapper, b:PigWrapper) -> PigWrapper {
    let newpig = PigWrapper(val: PigValue())
    newpig.pig.int = a.pig.int! % b.pig.int!
    return newpig
}