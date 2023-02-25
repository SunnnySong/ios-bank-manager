//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

run()

func run() {
    InputOutputManager.output(state: .open)
    let userInput = InputOutputManager.input()

    switch Menu(rawValue: userInput) {
    case .open:
        start()
    case .close:
        return
    case .none:
        print("올바르지 않은 입력")
    }
    run()
}

func start() {
    let queue: WaitingManager<customerInfo> = WaitingManager()
    
    Bank(waitingQueue: queue).open()
}
