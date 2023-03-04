//
//  TellerProvider.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/03/02.
//

import Foundation

enum TellerProvider {
    
    static func getTellers() -> [Teller] {
        
        let tellers = Task.allCases.map { task in
            Teller(tellerCount: DispatchSemaphore(value: Int(task.numberOfTeller)), task: task)
        }
        
        return tellers
    }
    
}
