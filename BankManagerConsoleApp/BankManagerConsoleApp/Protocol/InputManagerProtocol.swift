//
//  InputManagerProtocol.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

protocol InputManagerProtocol {
    func getUserInput() -> String?
    
}

//MARK: - Extension

extension InputManagerProtocol {
    func getUserInput() -> String? {
        let inputedData = readLine()
        return inputedData
    }
    
}
