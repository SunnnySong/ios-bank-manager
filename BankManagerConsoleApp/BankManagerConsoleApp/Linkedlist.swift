//
//  LinkedlistQueue.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

struct Linkedlist<T>: QueueDataStructure {
    var front: LinkedlistNode<T>?
//
//    func first() -> LinkedlistNode<T>? {
//        return head
//    }
    
    mutating func append(data: T) {
        let node = LinkedlistNode(value: data)
        self.enqueue(node)
    }
}





