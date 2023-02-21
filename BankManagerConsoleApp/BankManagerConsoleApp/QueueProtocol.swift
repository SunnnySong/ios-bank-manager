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

protocol Queue {
    associatedtype N: Node
    associatedtype T
    var head: N? { get set }    // T = Node
    
    mutating func enqueue(_ newNode: N)
    mutating func dequeue() -> N?
//    func clear()
//    func peek()
//    func isEmpty() -> Bool
}

extension Queue where N == LinkedlistNode<T> {
    mutating func enqueue(_ newNode: N) {
        if head == nil {
            head = newNode
            return
        }

        var node = head
        while node?.next != nil {
            node = node?.next
        }

        node?.next = newNode
    }
    
    mutating func dequeue() -> N? {
        guard head != nil else {
            return nil
        }

        let result = head
        head = head?.next

        return result
    }
}
