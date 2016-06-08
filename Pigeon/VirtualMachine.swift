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
    
    init(){
        self.mode = MachineMode.opr1
    }
    
    func compile(input:String) -> Void {
        let code = input.matchesForRegexInText("\".*?\"|[^ ]+")
        for instruc in code {
            switch self.mode {
            case .opr1:
                if symbolsets.prefixopers.contains(instruc) {
                    oper = instruc
                    print(oper!)
                    mode = MachineMode.r1
                }
                else {
                    var newpig = PigValue()
                    MakeValue.parsePigValue(&newpig, string: instruc)
                    r1 = newpig
                    mode = MachineMode.op
                    print(r1!.int)
                }
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
                MakeValue.parsePigValue(&newpig, string: instruc)
                r2 = newpig
                mode = MachineMode.exec
            case .exec:
                if r1 != nil && r2 != nil {
                    r3 = InFixOps.math[oper!]!(r1!, r2!)
                }
            default:
                print("Syntax Error")
            }
        }
        print(r3!)
    }
}

//union of associated machine mode types to keep track of the vm state
enum MachineMode {
    case r1
    case opr1
    case op
    case r2
    case exec
}
