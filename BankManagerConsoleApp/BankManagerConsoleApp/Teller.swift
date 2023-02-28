//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/28.
//

import Foundation

struct Teller: TellerProtocol {
    
    var task: Task
    
    func startWork(waitingNumber: UInt, queue: DispatchQueue, totalGroup: DispatchGroup) {
        let group = DispatchGroup()
        
        group.enter()
        queue.sync {
            report(waitingNumber: waitingNumber, inProgress: true)
//            self.task.rawValue.sleep()
            queue.async {
                5.sleep()
            }
            group.leave()
        }
        
        group.notify(queue: queue) {
            finishWork(waitingNumber: waitingNumber)
            totalGroup.leave()
        }
        
    }
    
    func finishWork(waitingNumber: UInt) {
        report(waitingNumber: waitingNumber, inProgress: false)
    }
    
    func report(waitingNumber: UInt, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, inProgress))
    }
}
