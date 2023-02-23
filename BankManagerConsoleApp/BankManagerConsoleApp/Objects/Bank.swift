//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/22.
//

import Foundation

protocol Bank {
    func addCustomer(in queue: WaitingManager<UInt>, number: UInt)
    func serveCustomer(with queue: WaitingManager<UInt>) -> UInt?
    func working(time: Double)
}

// 객체1 : 은행
extension Bank {
    // 손님 줄세우기
    // 여기서 waitingQueue에 들어오는 item 을 customer type으로 지정해도 괜찮을지? 아니면 여기서도 제네릭으로 표현해야 하는지?
    func addCustomer(in queue: WaitingManager<UInt>, number: UInt) {
        queue.enqueue(number)
    }
    
    func serveCustomer(with queue: WaitingManager<UInt>) -> UInt? {
        // 은행 업무 시작
        let customerNumber = queue.dequeue()
        // 업무 중인 고객 return
        return customerNumber
    }
    
    func working(time: Double) {
        // Step3에서는 업무의 type도 추가
        sleep(UInt32(time))
    }
}

// 객체2 : 행원
//    struct Banker {
        
        // 손님 응대 시작 -> 은행에게 알리기
        
        // 한 명의 손님이 일이 끝났을 경우 -> 은행에게 알리기
//    }
