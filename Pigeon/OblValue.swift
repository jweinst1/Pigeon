//
//  OblValue.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/5/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//basic dynamic value that the pigeon language operates on

struct PigValue {
    var fn:((inout arg:PigValue) ->())?
    var int:Int?
    var string:String?
    var bool:Bool?
    var list:[PigValue]?
    var map:[String:PigValue]?
}

class MakeValue {
    
    static func parsePigValue(inout pig:PigValue, string:String) {
        //parses as string into the pigval
        if string.matchPattern("\".*?\"") {
            pig.string = string.shaveEnds()
        }
        //parses as into into the pigval
        else if let integer = Int(string) {
            pig.int = integer
        }
    }
}