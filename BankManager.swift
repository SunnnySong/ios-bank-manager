//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    let waitingQueue = WaitingManager<Customer>()
    let bank:Bank
    
    let a = BankAbility.numberOfCustomer
    
    for _ in (0...a) {
        
    }
    
    func operateBank() {
        while let task  = waitingQueue.dequeue() {
            bank.reception(of:task)
        }
    }
}
