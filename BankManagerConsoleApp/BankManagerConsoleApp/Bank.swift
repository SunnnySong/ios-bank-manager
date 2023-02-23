//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

struct Bank {
    func reception(of customer: Customer){
        sleep(UInt32(customer.taskDuration))
    }
}
