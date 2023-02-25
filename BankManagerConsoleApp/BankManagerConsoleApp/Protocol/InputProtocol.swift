//
//  InputProtocol.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

protocol InputProtocol {
    func getUserInput() -> String?
    
}

//MARK: - Extension

extension InputProtocol {
    func getUserInput() -> String? {
        let inputedData = readLine()
        return inputedData
    }
    
}
