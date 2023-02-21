//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var waitingQueue = WaitingManager<Int>()
waitingQueue.add(1)
waitingQueue.add(2)
waitingQueue.add(3)

print(waitingQueue.reduce())
print(waitingQueue.reduce())
print(waitingQueue.reduce())
print(waitingQueue.reduce())
waitingQueue.add(4)
waitingQueue.add(5)
print(waitingQueue.reduce())
