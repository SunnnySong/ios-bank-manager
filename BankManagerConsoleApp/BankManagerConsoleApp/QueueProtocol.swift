//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

protocol Queue {
    associatedtype T
    var head: LinkedlistNode<T>? { get set }
    
    mutating func enqueue(_ newNode: LinkedlistNode<T>)
    mutating func dequeue() -> LinkedlistNode<T>?
    func clear()
    func peek()
    func isEmpty() -> Bool
}

extension Queue {
    mutating func enqueue(_ newNode: LinkedlistNode<T>) {
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
    
    mutating func dequeue() -> LinkedlistNode<T>? {
        guard head != nil else {
            return nil
        }
        
        let result = head
        head = head?.next
        
        return result
    }
    
    func clear() {
        
    }
    
    func peek() {
        
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
}
