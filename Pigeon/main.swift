//
//  main.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/5/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

var test = PigValue()
var dict = [String:PigValue]()


MakeValue.parsePigValue(&test, string: "\"fooo\"")

dict["doo"] = test
print(dict["doo"]!.string!)


