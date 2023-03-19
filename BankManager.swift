//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    
    private let numberOfGuest: UInt = CustomerConstant.numberOfCustomer
    private let waitingQueue: WaitingQueue<Customer>
    private let tellers: [Task: Teller]
    let queue = DispatchQueue(label: "customerQueue", qos: .default, attributes: .concurrent)
    
    // MARK: - init
    
    init(waitingQueue: WaitingQueue<Customer>) {
        self.waitingQueue = waitingQueue
        self.tellers = {
            var tellers = [Task: Teller]()
            
            Task.allCases.forEach { task in
                tellers[task] = Teller(task: task)
            }
            return tellers
        }()
    }
    
}

extension BankManager {
    
    func makeCustomer(number: UInt) -> Customer {
        let newCustomer = Customer(number: number, task: Task.randomTask())
        return newCustomer
        
    }
    
    @discardableResult
    func generateWaiting(range: ClosedRange<UInt>) -> [Customer] {
        var newCustomers: [Customer] = []
        range.forEach { number in
            let newCustomer = makeCustomer(number: number)
            waitingQueue.enqueue(newCustomer)
            newCustomers.append(newCustomer)
        }
        return newCustomers
    }
    
    func dealCustomer(group: DispatchGroup, completion: @escaping (Customer, Bool) -> Void) {
//        let queue = DispatchQueue.global(qos: .background)
        
        while let customer = waitingQueue.dequeue() {
            
            let workItem = DispatchWorkItem {
                group.enter()
                guard let teller = self.tellers[customer.task] else { return }
                teller.work { processState in
                    completion(customer, processState)
                }
                group.leave()
            }
            
//            guard let teller = tellers[customer.task] else { return }
            
//            queue.async(group: group) {
//                teller.work() { processState in
//                    completion(customer, processState)
//                }
//            }
//            group.leave()
            
            queue.async(group: group, execute: workItem)
        }
    }
    
    func resetQueue() {
        // 현재 진행하고 있던 queue의 작업을 일시 정지, 후 재개.
        queue.suspend()
        waitingQueue.clear()
        queue.resume()
    }
    
    func findFirst() {
        print(waitingQueue.peek())
    }
    
    private func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }
    
    private func finalReport(time: Double) {
        InputOutputManager.output(state: .close(numberOfGuest, time))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        generateWaiting(range: 0...numberOfGuest)
        
        let group = DispatchGroup()
        var totalDuration = 0.0
        dealCustomer(group: group) { customer, processState  in
            report(waitingNumber: customer.number, task: customer.task, inProgress: processState)
            totalDuration += Task.duration(of: customer.task)
        }
        group.wait()
        close(time: totalDuration)
    }
    
    func close(time: Double) {
        finalReport(time: time)
    }
    
}
