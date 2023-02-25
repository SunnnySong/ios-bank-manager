//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    //MARK: - Properties
    
    let bank:BankProtocol
    var inputManager: InputProtocol
    var outputManager: OutputProtocol
    
    //MARK: - Methodes
    
    func bankOpen() {
//        bank.reception()
    }
    
    private func selectMenu() -> () -> Void {
        outputManager.showSystemOutput
        let userInput = inputManager.getUserInput()
    }
    
}
