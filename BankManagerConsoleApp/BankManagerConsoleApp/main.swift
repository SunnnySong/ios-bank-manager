//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankManager = BankManager(bank: Bank(waitingQueue: WaitingManager<(UInt,Customer)>()),inputManager: InputManager(),outputManager: OutputManager())

bankManager.bankOpen()

