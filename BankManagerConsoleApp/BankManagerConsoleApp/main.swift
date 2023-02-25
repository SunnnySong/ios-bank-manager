//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager(bank: Bank(waitingQueue: WaitingManager<(UInt,Customer)>()),inputManager: InputManager(),outputManager: OutputManager())
operateProgram()

private func operateProgram() {
    switch bankManager.selectConsolMenu() {
    case .openBank:
        bankManager.bankOpen()
    case .terminate:
        return
    case .none:
        print("1 또는 2 를 입력하세요")
    }
    operateProgram()
}
