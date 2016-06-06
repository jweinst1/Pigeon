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
    var mode:MachineMode
    
    init(){
        self.mode = MachineMode.opr1
    }
}

//union of associated machine mode types to keep track of the vm state
enum MachineMode {
    case opr1
    case op
    case r2
    case exec
}
