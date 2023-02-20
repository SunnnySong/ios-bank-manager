//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/20.
//

import Foundation

/*
 모든 Queue는 아래와 같은 동일한 메서드와 Node를 갖기 때문에 protocol로 설정
 */
protocol Node {
    associatedtype T
    var value: T { get }
    var next: Self? { get set }
}

protocol Queue {
    mutating func enqueue<Element: Node>(_ newNode: Element)
    mutating func dequeue<Element: Node>() -> Element?
    func clear()
    func peek()
    func isEmpty() -> Bool
}
