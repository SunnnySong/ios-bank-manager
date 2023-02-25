//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

protocol BankProtocol {
    var waitingQueue: WaitingManager<(UInt,Customer)> { get set }
    
    mutating func reception()
}

struct Bank: BankProtocol {
    
    //MARK: - Properties
    
    var waitingQueue: WaitingManager<(UInt, Customer)>
    let customerNumber = BankAbility.numberOfCustomer
    var teller = Teller()
    var serviceCount: UInt = .zero
    
    //MARK: - Methodes
    
    mutating func reception() {
        greetingCustomer()
        processTask()
        finalReport()
    }
    
    private func greetingCustomer() {
        (1...customerNumber).forEach {
            waitingQueue.enqueue(($0,Customer(taskDuration: BankAbility.durationOfTask)))
        }
    }
    
    private mutating func processTask() {
        while let task  = waitingQueue.dequeue() {
            guard teller.tellerCount >= 1 else { return }
            teller.tellerPhaseIn()
            dealWith(task: task.1, ticketNumber: task.0)
            teller.tellerPhaseOut()
            serviceCount += 1
        }
    }
    
    private func dealWith(task: Customer, ticketNumber: UInt) {
        print("\(ticketNumber)번 고객 업무 시작")
        task.taskDuration.sleep()
        print("\(ticketNumber)번 고객 업무 완료")
    }
    
    private func finalReport() {
        let time = String(format: "%.2f",(BankAbility.durationOfTask*Double(serviceCount)))
        print("업무가마감되었습니다. 오늘 업무를 처리한 고객은 총\(serviceCount)명이며, 총 업무시간은 \(time)초입니다.")
    }
}
