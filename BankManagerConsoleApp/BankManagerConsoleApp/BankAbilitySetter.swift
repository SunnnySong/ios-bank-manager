//
//  BankAbilitySetter.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

enum BankAbility {
    
    //MARK: - Constants
    
    enum CustomerContants: UInt {
        case max = 30
        case min = 10
    }
    
    //MARK: - Properties
    
    static let numberOfClerk = 1
    static let durationOfTask = 0.7
    static var numberOfCustomer:UInt {
        UInt.random(in: CustomerContants.min.rawValue...CustomerContants.max.rawValue)
    }
    
}
