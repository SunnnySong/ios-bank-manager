//
//  LinkedlistQueue.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

struct LinkedlistQueue<T>: Queue {
    var head: LinkedlistNode<T>?
    
    func first() -> LinkedlistNode<T>? {
        return head
    }
}

extension LinkedlistQueue {
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



