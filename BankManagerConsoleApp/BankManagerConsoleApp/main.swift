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

print(waitingQueue.remove())
print(waitingQueue.remove())
print(waitingQueue.remove())
