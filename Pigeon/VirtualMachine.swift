//
//  VirtualMachine.swift
//  Pigeon
//
//  Created by Joshua Weinstein on 6/6/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//main file for virtual machine

class VirtualMachine {
    var oper:String?
    var r1:PigValue?
    var r2:PigValue?
    var r3:PigValue?
    var mode:MachineMode
    var variables:[String:PigValue]
    
    init(){
        self.mode = MachineMode.r1
        //dictionary to store variables
        self.variables = [String:PigValue]()
    }
    
    func compile(input:String) -> Void {
        let code = input.matchesForRegexInText("\".*?\"|[^ ]+")
        for instruc in code {
            switch self.mode {
            case .r1:
                var newpig = PigValue()
                MakeValue.parsePigValue(&newpig, string: instruc, vm:self)
                r1 = newpig
                mode = MachineMode.op
            case .op:
                if symbolsets.infixopers.contains(instruc) {
                    oper = instruc
                    mode = MachineMode.r2
                }
                else {
                    print("Syntax Error")
                }
            case .r2:
                var newpig = PigValue()
                MakeValue.parsePigValue(&newpig, string: instruc, vm:self)
                r2 = newpig
                self.execute()
                //restarts state after execution
                mode = MachineMode.r1
            }
        }
    }
    func execute() -> Void {
        if r1 != nil && r2 != nil {
            if let opfunc = InFixOps.math[oper!] {
                r3 = opfunc(r1!, r2!)
            }
            else if let opfunc = InFixOps.voids[oper!] {
                opfunc(r1!, r2!)
            }
            else if r1!.string!.characters.first == "@" && oper == "=" {
                variables[r1!.string!] = r2!
            }
        }
    }
}

//union of associated machine mode types to keep track of the vm state
enum MachineMode {
    case r1
    case op
    case r2
}


