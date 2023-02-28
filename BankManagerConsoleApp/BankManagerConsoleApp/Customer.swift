//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

struct Customer {
    var task: Task?
    
    init() {
        self.task = Task.allCases.randomElement()
    }
}

enum Task: Double, CaseIterable {
    case deposit = 1.1
    case loan = 5
}
