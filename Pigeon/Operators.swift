//
//  Operators.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/7/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation
//operator overloads for pigwrapper and pigvalues
func + (a:PigValue, b:PigValue) -> PigValue {
    let newpig = PigValue()
    newpig.int = a.int! + b.int!
    return newpig
}

func - (a:PigValue, b:PigValue) -> PigValue {
    let newpig = PigValue()
    newpig.int = a.int! - b.int!
    return newpig
}

func * (a:PigValue, b:PigValue) -> PigValue {
    let newpig = PigValue()
    newpig.int = a.int! * b.int!
    return newpig
}

func / (a:PigValue, b:PigValue) -> PigValue {
    let newpig = PigValue()
    newpig.int = a.int! / b.int!
    return newpig
}

func % (a:PigValue, b:PigValue) -> PigValue {
    let newpig = PigValue()
    newpig.int = a.int! % b.int!
    return newpig
}