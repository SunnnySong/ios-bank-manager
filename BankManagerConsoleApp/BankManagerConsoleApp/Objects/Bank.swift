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
    let waitingQueue = WaitingManager<Customer>()
    
    // 영업 시작하기
    
    // 손님 번호표주기
    func queueUpCustomer() {
        (1...Namespace.numberOfCustomer).forEach { _ in
            bankManager.addCustomer(in: waitingQueue)
        }
    }
    
    // 영업 종료하기
    func finish() {
        InputOutputManager.output(state: .close(Namespace.numberOfCustomer, Double(Namespace.numberOfCustomer) * 0.7))
    }
    
    // 손님 응대 현황 공유하기
    
    
    // 객체2 : 행원
    struct Banker {
        
        // 손님 응대 시작 -> 은행에게 알리기
        
        // 한 명의 손님이 일이 끝났을 경우 -> 은행에게 알리기
        
    }
}


