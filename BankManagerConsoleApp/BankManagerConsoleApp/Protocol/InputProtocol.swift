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
        var inputedData = readLine()
        inputedData = inputedData?.trimmingCharacters(in: [" "])
        return inputedData
    }
    
}
