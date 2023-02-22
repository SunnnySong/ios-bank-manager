//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 은행 관리 업무
struct BankManager {
    // 은행 업무 시작
    func run() {
        InputOutputManager.output(state: .open)
        let userInput = InputOutputManager.input()

        switch Menu(rawValue: userInput) {
        case .open:
            print("은행 개점")
            waitingCustomer()
            //    BankManager().start()
        case .close:
            print("은행 클로즈")
            return
        case .none:
            print("잘못눌렸어요.")
        }
        run()
    }
}

extension BankManager {
    // 손님 줄세우기?
    func waitingCustomer() {
        let waitingQueue = WaitingManager<Customer>()
        guard let customerSum = (10...30).randomElement() else { return }
        
        (0...customerSum).forEach { num in
            waitingQueue.enqueue(Customer())
            print("손님 \(num)명 대기")
        }
    }
    
    func working() {
        
    }
}

// 처음 사용자에게 띄워주는 메뉴
enum Menu: String {
    case open = "1"
    case close = "2"
}
