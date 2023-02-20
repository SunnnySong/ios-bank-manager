//
//  LinkedlistQueue.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

struct LinkedlistQueue<T> {
    private var head: LinkedlistNode<T>?
}

extension LinkedlistQueue: Queue {
    func first() -> LinkedlistNode<T>? {
        return head
    }
    
    mutating func enqueue<Element>(_ newNode: Element) where Element : Node {
        if head == nil {
            head = newNode as? LinkedlistNode<T>
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = newNode as? LinkedlistNode<T>
    }
    
    mutating func dequeue<Element>() -> Element? where Element : Node {
        guard head != nil else {
            return nil
        }
        
        let result: Element?
        
        result = head?.value as? Element
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
