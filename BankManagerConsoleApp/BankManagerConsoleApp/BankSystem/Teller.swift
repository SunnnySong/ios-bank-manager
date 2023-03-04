//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/03/03.
//

import Foundation

class Teller: TellerProtocol {
    
    var tellerCount: DispatchSemaphore
    
    init(tellerCount: DispatchSemaphore) {
        self.tellerCount = tellerCount
    }
    
}
