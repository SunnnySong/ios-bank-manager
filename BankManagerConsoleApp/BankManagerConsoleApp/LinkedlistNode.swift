//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

final class LinkedlistNode<T>: Node {
    var value: T
    var next: LinkedlistNode?

    init(value: T, next: LinkedlistNode? = nil) {
        self.value = value
        self.next = next
    }
}




