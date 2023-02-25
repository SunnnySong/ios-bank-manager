//
//  OutputManager.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/24.
//

import Foundation

struct OutputManager: OutputProtocol {

    func showSystemOutput() {
        print(OperateMenu.consolMenu, terminator: " ")
    }
}
