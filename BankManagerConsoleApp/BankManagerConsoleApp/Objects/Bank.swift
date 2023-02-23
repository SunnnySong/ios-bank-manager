//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/22.
//

import Foundation

// 객체1 : 은행
struct Bank {
    let bankManager = BankManager()
    // 은행원을 갖고 있음?
//    var numberOfBanker = [Banker]()
    
    // 은행 대기열
    let waitingQueue = WaitingManager<UInt>()
    
    // 오늘의 손님 수
    let customers = Namespace.numberOfCustomer
    
    // 손님 번호표주기
    func queueUpCustomer() {
        (1...customers).forEach { number in
            bankManager.addCustomer(in: waitingQueue, number: number)
        }
        
        servingCustomer()
    }
    
    // 은행원들이 손님 응대하기
    func servingCustomer() {
        (1...customers).forEach { _ in
            // 은행 업무 시작
            guard let customerNumber = bankManager.serveCustomer(with: waitingQueue) else { return }
            // 은행 업무 시작했다고 알리기
            shareService(status: customerNumber, SOF: true)
            bankManager.working(time: 0.7)
            shareService(status: customerNumber, SOF: false)
        }
        // 업무 종료
        finish()
    }
    
    // 손님 응대 현황 공유하기
    func shareService(status: UInt, SOF: Bool) {
        InputOutputManager.output(state: .working(status, SOF))
    }
    
    // 영업 종료하기
    func finish() {
        InputOutputManager.output(state: .close(customers, Double(customers) * 0.7))
    }
    
    // 객체2 : 행원
    struct Banker {
        
        // 손님 응대 시작 -> 은행에게 알리기
        
        // 한 명의 손님이 일이 끝났을 경우 -> 은행에게 알리기
        
    }
}


