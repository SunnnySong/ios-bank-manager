//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

protocol BankProtocol {
    var waitingQueue: WaitingManager<(UInt,Customer)> { get set }
    
    func reception()
}

struct Bank: BankProtocol {
    
    //MARK: - Properties
    
    var waitingQueue: WaitingManager<(UInt, Customer)>
    let customerNumber = BankAbility.numberOfCustomer
    
    //MARK: - Methodes
    
    func reception() {
        greetingCustomer()
        processTask()
    }
    
    private func greetingCustomer() {
        (1...customerNumber).forEach {
            waitingQueue.enqueue(($0,Customer(taskDuration: BankAbility.durationOfTask)))
        }
    }
    
    private func processTask() {
        while let task  = waitingQueue.dequeue() {
            let customer = task.1
            print("\(task.0)번 고객 업무 시작")
            customer.taskDuration.sleep()
            print("\(task.0)번 고객 업무 완료")
        }
    }
    
}
