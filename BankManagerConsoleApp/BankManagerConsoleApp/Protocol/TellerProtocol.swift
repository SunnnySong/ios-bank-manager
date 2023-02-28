//
//  TellerProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

protocol TellerProtocol {
    
    func startWork(waitingNumber: UInt, queue: DispatchQueue, totalGroup: DispatchGroup)
    func finishWork(waitingNumber: UInt)
    
}
