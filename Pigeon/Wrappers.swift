//
//  Wrappers.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/5/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//class to wrap instances of the pig value for easy transportation around the interpreter
class PigWrapper {
    var pig:PigValue
    
    init(val:PigValue) {
        self.pig = val
    }
}
