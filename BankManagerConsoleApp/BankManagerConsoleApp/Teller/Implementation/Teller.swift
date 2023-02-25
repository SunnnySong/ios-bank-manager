//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/25.
//

import Foundation

struct Teller: TellerProvidable {
    // MARK: - Private property

    // 손님 응대하기
    func working() {
        // 추후 은행원 일 타입에 따라 시간 변경
        Namespace.workTime.sleep()
    }
    
    // 다음 대기 손님 부르기
    func call(waitingNumber: UInt, result: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, result))
    }

}
