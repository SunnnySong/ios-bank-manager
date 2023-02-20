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
    associatedtype T
    var head: T? { get set }
    
    mutating func enqueue(_ newNode: T)
    mutating func dequeue() -> T?
    func clear()
    func peek()
    func isEmpty() -> Bool
}
