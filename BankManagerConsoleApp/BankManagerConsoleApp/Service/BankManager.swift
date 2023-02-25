//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    //MARK: - Properties
    
    var bank:BankProtocol
    var inputManager: InputProtocol
    var outputManager: OutputProtocol
    
    //MARK: - Methodes
    func selectConsolMenu() -> OperateMenu? {
        selectConsoleMenu()
    }
    
    mutating func bankOpen() {
        bank.reception()
    }
    
    private func selectConsoleMenu() -> OperateMenu? {
        outputManager.showSystemOutput()
        guard let userInput = inputManager.getUserInput() else { return nil }
        return OperateMenu(rawValue: userInput)
    }
    
}
