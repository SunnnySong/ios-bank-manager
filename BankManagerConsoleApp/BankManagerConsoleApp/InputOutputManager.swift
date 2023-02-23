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
    case working(UInt, Bool)
}

fileprivate extension BankState {
    var text: String {
        switch self {
        case .open:
            return Namespace.printText.state
        case .close(let numberOfCustomer, let customerTime):
            return Namespace.printText.cloase(numberOfCustomer: numberOfCustomer, customerTime: customerTime)
        case .working(let order, let result):
            return Namespace.printText.working(order: order, result: result)
        }
    }
}

    
