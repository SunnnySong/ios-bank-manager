//
//  BankProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/22.
//

import Foundation

typealias waitingNumber = UInt
typealias customerInfo = (number: waitingNumber, customer: Customer)

protocol BankProtocol {
    // 손님 번호표 나눠주기 ..? 은행 개점에 들어가야하나?
    // 은행 개점하기
    func open()
    // 은행 닫기
    func close()
}
