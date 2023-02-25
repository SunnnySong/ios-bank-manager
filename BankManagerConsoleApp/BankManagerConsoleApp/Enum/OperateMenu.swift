//
//  OperateMenu.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/24.
//

import Foundation

enum OperateMenu: String, CaseIterable {
    case openBank = "1"
    case terminate = "2"
}

extension OperateMenu {
    var description: String {
        switch self {
        case .openBank:
            return "은행개점"
        case .terminate:
            return "종료"
        }
    }
    
    static var consolMenu: String {
        let menu = OperateMenu.allCases.map{"\($0.rawValue) : \($0.description)\n"}.joined()
        return menu + "입력 :"
    }
    
}
