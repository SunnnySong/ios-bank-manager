//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    let waitingQueue = WaitingManager<(UInt,Customer)>()
    let bank:Bank
    let customerNumber = BankAbility.numberOfCustomer
    
    func operateBank() {
        (1...customerNumber).forEach {
            waitingQueue.enqueue(($0,Customer(taskDuration: BankAbility.durationOfTask)))
        }
            
        while let task  = waitingQueue.dequeue() {
            print("\(task.0)번 고객 업무 시작")
            bank.reception(of:task.1)
            print("\(task.0)번 고객 업무 완료")
        }
    }
    
}
