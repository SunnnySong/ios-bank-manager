//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

protocol Node {
    associatedtype T
    var value: T { get }
    var next: Self? { get set }
}

protocol QueueDataStructure {
    associatedtype Item
    associatedtype T
    var front: Item? { get set }
    
    mutating func enqueue(_ newItem: Item)
    mutating func dequeue() -> Item?
}

extension QueueDataStructure where Item == LinkedlistNode<T> {
    
    mutating func enqueue(_ newItem: Item) {
        if front == nil {
            front = newItem
            return
        }

        var node = front
        while node?.next != nil {
            node = node?.next
        }

        node?.next = newItem
    }
    
    mutating func dequeue() -> Item? {
        guard front != nil else {
            return nil
        }

        let result = front
        front = front?.next

        return result
    }
}
