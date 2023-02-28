//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    
    private let numberOfGuest: UInt = BankAbility.CustomerAmount.numberOfCustomer
    private let waitingQueue: WaitingQueue<CustomerInfo>
    //    private var tellers = [ Teller(task: .deposit), Teller(task: .deposit), Teller(task: .loan)]
    private var teller1 = Teller(task: .deposit)
    private var teller2 = Teller(task: .deposit)
    private var teller3 = Teller(task: .loan)
    
    // MARK: - init
    
    init(waitingQueue: WaitingQueue<CustomerInfo>) {
        self.waitingQueue = waitingQueue
    }
    
}

extension BankManager {
    
    private func greeting(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            var newCustomer: Customer {
                return Customer()
            }
            let newData: CustomerInfo = CustomerInfo(number: number, customer: newCustomer)
            waitingQueue.enqueue(newData)
        }
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * BankAbility.taskDuration))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        // 손님 대기열 올리기
        greeting(customers: numberOfGuest, to: waitingQueue)
        
        // 비동기로 손님 처리하기.
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        
        // 손님 대기열에서 빼내기 -> waitingQueue가 isEmpty가 될때까지 반복
        while let customer = waitingQueue.dequeue() {
            group.enter()
            teller1.startWork(waitingNumber: customer.number, queue: queue, totalGroup: group)
        }
        group.wait()
        close()
    }
    
    func close() {
        finalReport()
    }
    
}
