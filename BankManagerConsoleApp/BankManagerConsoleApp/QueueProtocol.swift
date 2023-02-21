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
    associatedtype N: Node
    associatedtype T
    var front: N? { get set }    // T = Node
    
    mutating func enqueue(_ newNode: N)
    mutating func dequeue() -> N?
//    func clear()
//    func peek()
//    func isEmpty() -> Bool
}

extension QueueDataStructure where N == LinkedlistNode<T> {
    mutating func enqueue(_ newNode: N) {
        if front == nil {
            front = newNode
            return
        }

        var node = front
        while node?.next != nil {
            node = node?.next
        }

        node?.next = newNode
    }
    
    mutating func dequeue() -> N? {
        guard front != nil else {
            return nil
        }

        let result = front
        front = front?.next

        return result
    }
}
