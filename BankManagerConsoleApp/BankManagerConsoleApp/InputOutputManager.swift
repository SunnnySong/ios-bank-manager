//
//  InputOutputManager.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/22.
//

import Foundation

// 입출력 관리
enum InputOutputManager {
    static func output(state: BankState) {
        print(state.text, terminator: "")
    }
    
    static func input() -> String {
        guard let userInput = readLine() else {
            // error 던지는 구문 구현
            return ""
        }
        return userInput
    }
}

enum BankState {
    case open
    case close(UInt, Double)
    case working(Int, Bool)
}

fileprivate extension BankState {
    var text: String {
        switch self {
        case .open:
            return "1 : 은행개점 \n2 : 종료 \n입력 : "
        case .close(let numberOfCustomer, let customerTime):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(customerTime)초 입니다."
        case .working(let order, let result):
            let resultString = (result == true) ? "시작" : "완료"
            return "\(order)번 고객 업무 \(resultString)"
        }
    }
}

    
