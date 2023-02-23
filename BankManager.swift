//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 은행 관리 업무: 모든 은행들은 아래와 같은 행동들을 한다.
// 추후 프로토콜로 변경해보기.
struct BankManager: Bank {
    // 은행원을 갖고 있음?
//    var numberOfBanker = [Banker]()
    
    // 은행 대기열
    let waitingQueue = WaitingManager<UInt>()
    
    // 오늘의 손님 수
    let customers = Namespace.numberOfCustomer
    
    // 손님 번호표주기
    func queueUpCustomer() {
        (1...customers).forEach { number in
            addCustomer(in: waitingQueue, number: number)
        }
        servingCustomer()
    }
    
    // 은행원들이 손님 응대하기
    func servingCustomer() {
        (1...customers).forEach { _ in
            // 은행 업무 시작
            guard let customerNumber = serveCustomer(with: waitingQueue) else { return }
            // 은행 업무 시작했다고 알리기
            shareService(status: customerNumber, SOF: true)
            working(time: Namespace.workTime)
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
        InputOutputManager.output(state: .close(customers, Double(customers) * Namespace.workTime))
    }
}

// 처음 사용자에게 띄워주는 메뉴
enum Menu: String {
    case open = "1"
    case close = "2"
}
