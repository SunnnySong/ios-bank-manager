//
//  LinkedlistQueue.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

struct LinkedlistQueue<T>: Queue {
    internal var head: LinkedlistNode<T>?
    
    func first() -> LinkedlistNode<T>? {
        return head
    }
}


