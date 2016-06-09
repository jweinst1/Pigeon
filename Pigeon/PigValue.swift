//
//  OblValue.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/5/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//basic dynamic value that the pigeon language operates on

class PigValue {
    var fn:((inout arg:PigValue) ->())?
    var int:Int?
    var string:String?
    var bool:Bool?
    var list:[PigValue]?
    var map:[String:PigValue]?
    
    func printval() -> Void {
        if let val = int {
            print(val)
        }
        else if let val = string {
            print(val)
        }
        else if let val = bool {
            print(val)
        }
        else if let val = list {
            if val.isEmpty {
                print("[]")
            }
            else {
                for elem in val {
                    elem.printval()
                }
            }
        }
    }
}

class MakeValue {
    
    static func parsePigValue(inout pig:PigValue, string:String, vm:VirtualMachine) {
        //parses as string into the pigval
        if string.matchPattern("\".*?\"") {
            pig.string = string.shaveEnds()
        }
        //parses as into into the pigval
        else if let integer = Int(string) {
            pig.int = integer
        }
            //parsing for names
        else if string.matchPattern("^@.+") {
            pig.string = string
        }
            //proceeds to switch cases for literal values
        else {
            switch string {
            case "~r":
                pig = vm.r3!
            case "true", "True":
                pig.bool = true
            case "false", "False":
                pig.bool = false
            case "[]":
                pig.list = [PigValue]()
            case "{}":
                pig.map = [String:PigValue]()
            default:
                pig.string = "Syntax Error"
            }
        }
    }
}