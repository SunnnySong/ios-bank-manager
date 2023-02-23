//
//  SystemManager.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/23.
//

import Foundation

struct SystemManager {
    func run() {
        InputOutputManager.output(state: .open)
        let userInput = InputOutputManager.input()

        switch Menu(rawValue: userInput) {
        case .open:
            print("은행 개점")
            Bank().queueUpCustomer()
//            Bank().servingCustomer()
        case .close:
            print("은행 클로즈")
            return
        case .none:
            print("잘못눌렸어요.")
        }
        run()
    }
}

enum Namespace {
    
    enum CustomerAmount: UInt {
        case min = 10
        case max = 30
    }
    
    static var numberOfCustomer: UInt {
        guard let customerSum = (CustomerAmount.min.rawValue...CustomerAmount.max.rawValue).randomElement() else { return 0 }
        return customerSum
    }
}
