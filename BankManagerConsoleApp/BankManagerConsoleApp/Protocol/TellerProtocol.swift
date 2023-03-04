//
//  TellerProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

protocol TellerProtocol: AnyObject {
    
    var tellerCount: DispatchSemaphore { get }
    var task: Task { get }
    
}
