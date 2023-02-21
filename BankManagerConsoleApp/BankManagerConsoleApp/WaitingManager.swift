//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/21.
//

import Foundation

struct WaitingManager<T>: QueueDataStructure {
    var front: LinkedlistNode<T>?
    
//    private var queue: Linkedlist = Linkedlist<T>()
    private var queue = LinkedlistNode<T>()
    
    mutating func add(_ newData: T) {
        let newNode = LinkedlistNode(value: newData)
        self.enqueue(newNode)
    }
    
    mutating func remove() -> T? {
        let result = self.dequeue()
        return result?.value
    }
}
