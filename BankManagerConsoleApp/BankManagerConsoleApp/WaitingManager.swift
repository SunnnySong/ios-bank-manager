//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/21.
//

import Foundation

struct WaitingManager<T>: QueueDataStructure {
    var front: LinkedlistNode<T>?
    
    mutating func add(_ customer: T) {
        let newNode = LinkedlistNode(value: customer)
        self.enqueue(newNode)
    }
    
    mutating func reduce() -> T? {
        let result = self.dequeue()
        return result?.value
    }
}
