//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    
    private let numberOfGuest: UInt = CustomerConstant.numberOfCustomer
    private let waitingQueue: WaitingQueue<CustomerInfo>
    
    // MARK: - init
    
    init(waitingQueue: WaitingQueue<CustomerInfo>) {
        self.waitingQueue = waitingQueue
    }
    
}

extension BankManager {
    
    private func generateWaiting(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = CustomerInfo(number: number)
            waitingQueue.enqueue(newCustomer)
        }
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * Task.duration(of: .deposit)))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        generateWaiting(customers: numberOfGuest, to: waitingQueue)
        
        let group = DispatchGroup()
        
        let telle1 = DispatchSemaphore(value: 1)
        let telle2 = DispatchSemaphore(value: 3)

        while let customer = waitingQueue.dequeue() {
            
            if customer.task == Task.deposit {
                work(group: group, number: customer.number, task: customer.task, semaphore: telle1)
            }
            if customer.task == Task.loan {
                work(group: group, number: customer.number, task: customer.task, semaphore: telle2)
            }

        }
        group.wait()
        close()
    }

    func close() {
        finalReport()
    }
    
    func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }

}

extension BankManager: TellerProtocol {
    
    func work(group: DispatchGroup ,number: UInt, task: Task, semaphore: DispatchSemaphore) {
        group.enter()
        DispatchQueue.global().async(group: group, execute: makeWorkItem(number: number, task: task, semaphore: semaphore))
        group.leave()
    }

    private func makeWorkItem(number: UInt, task: Task, semaphore: DispatchSemaphore) -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            semaphore.wait()
            print("\(number) : \(task.rawValue) 시작")
            Task.duration(of: task).sleep()
            semaphore.signal()
            print("\(number) : \(task.rawValue) 완료")
        }
        return workItem
    }
    
}
