//
//  TellerProvidable.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/25.
//

import Foundation

protocol TellerProvidable {
    
    func working()
    func call(waitingNumber: UInt, result: Bool)
}
