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
    var r1:PigWrapper?
    var r2:PigWrapper?
    var r3:PigWrapper?
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
                    mode = MachineMode.r1
                }
                else {
                    let newpig = PigWrapper(val:PigValue())
                    MakeValue.parsePigValue(&newpig.pig, string: instruc)
                    r1 = newpig
                    mode = MachineMode.op
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
                let newpig = PigWrapper(val:PigValue())
                MakeValue.parsePigValue(&newpig.pig, string: instruc)
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
