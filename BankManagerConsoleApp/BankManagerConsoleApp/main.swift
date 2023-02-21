//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var queue: Linkedlist<String> = Linkedlist<String>()

let new = LinkedlistNode(value: "newone")
queue.enqueue(new)
print(queue.first()?.value)
