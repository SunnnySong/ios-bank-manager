//
//  TellerProvider.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/03/02.
//

import Foundation

enum TellerProvider {
    
    static func getTellers() -> [Task:Teller] {
        
        var tellers = [Task:Teller]()
        Task.allCases.forEach { task in
            tellers[task] = Teller(tellerCount: DispatchSemaphore(value: Int(task.numberOfTeller)))
        }
        
        return tellers
    }
    
}
