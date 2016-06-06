//
//  main.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/5/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//class wrapper around pig value allows values to be called from collections
var test = PigValue()
var dict = [String:PigWrapper]()
dict["soo"] = PigWrapper(val: test)

MakeValue.parsePigValue(&dict["soo"]!.pig, string: "42")

print(dict["soo"]!.pig.int!)



