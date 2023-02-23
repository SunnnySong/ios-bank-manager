//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/22.
//

import Foundation

typealias waitingNumber = UInt
typealias customerInfo = (number: waitingNumber, customer: Customer)

protocol Bank {
    var waitingQueue: WaitingManager<customerInfo> { get }
    
    func addCustomer(number: waitingNumber)
    func serveCustomer() -> waitingNumber?
    func working(time: Double)
}

// 객체1 : 은행
extension Bank {
    // 손님 줄세우기
    func addCustomer(number: waitingNumber) {
        // Step3에서는 업무의 type도 추가
        let newCustomer = Customer()
        let newData: customerInfo = (number, newCustomer)
        waitingQueue.enqueue(newData)
    }
    
    func serveCustomer() -> waitingNumber? {
        // 은행 업무 시작
        let customerNumber = waitingQueue.dequeue()
        // 업무 중인 고객 return
        return customerNumber?.number
    }
    
    func working(time: Double) {
        // Step3에서는 업무의 type도 추가
        time.sleep()
    }
}



// 객체2 : 행원
//    struct Banker {
        
        // 손님 응대 시작 -> 은행에게 알리기
        
        // 한 명의 손님이 일이 끝났을 경우 -> 은행에게 알리기
//    }
