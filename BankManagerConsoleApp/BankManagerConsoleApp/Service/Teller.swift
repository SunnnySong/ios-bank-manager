//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/25.
//

import Foundation

struct Teller {
    var tellerCount = BankAbility.numberOfTeller
    
    mutating func tellerPhaseIn() {
        tellerCount -= 1
    }
    
    mutating func tellerPhaseOut() {
        tellerCount += 1
    }
}
