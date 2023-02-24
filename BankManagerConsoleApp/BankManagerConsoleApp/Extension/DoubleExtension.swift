//
//  DoubleExtension.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/23.
//

import Foundation

extension Double {
    func sleep() {
        let second: Double = 1000000
        usleep(useconds_t((self * second)))
    }
}
