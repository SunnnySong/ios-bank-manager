//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/25.
//

import Foundation

// Bank가 해야하는 모든 일 다 총 집합.
// 개점. 폐점 등 모든 코드 집합이라 생각
struct Bank: BankProtocol {
    
    // MARK: - private property
    
    // 은행원은 은행이 갖고 있는것이 더 적절하다고 생각함.
    private let teller: TellerProvidable = Teller()
    
    // 오늘 하루 오는 총 손님
    // 이것도 나중에 변경 가능하도록 넣어야 할까?
    private let numberOfGuest: UInt = Namespace.numberOfCustomer
    private let waitingQueue: WaitingManager<customerInfo>
    
    // MARK: - init
    
    init(
        waitingQueue: WaitingManager<customerInfo>
    ) {
        self.waitingQueue = waitingQueue
    }
    // MARK: - Public
    
    func open() {
        
        // 손님 번호표 나눠주기
        (1...numberOfGuest).forEach { number in
            let newCustomer = Customer()
            let newData: customerInfo = (number, newCustomer)
            waitingQueue.enqueue(newData)
        }
        
        // 가장 먼저 온 손님부터 은행원이 응대하기
        while let waitingNumber = waitingQueue.dequeue()?.number {
            // 가장 먼저 온 손님 응대 시작 알리기
            teller.call(waitingNumber: waitingNumber, result: true)
            
            // 은행원이 손님 일 처리하기
            teller.working()
            
            // 해당 손님의 일이 끝나면, 일 마침 알리기
            teller.call(waitingNumber: waitingNumber, result: false)
        }
        // 이 모든 과정을 대기열에 손님이 없을 때까지 반복한 후 폐점하기
        close()
    }
    
    func close() {
        // 오늘의 총 손님과 걸린 시간 알리기
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * Namespace.workTime))
    }
}
