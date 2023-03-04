//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/03/03.
//

import Foundation

class Teller: TellerProtocol {
    
    var tellerCount: DispatchSemaphore
    let task: Task
    
    init(tellerCount: DispatchSemaphore, task: Task) {
        self.tellerCount = tellerCount
        self.task = task
    }
    
}
