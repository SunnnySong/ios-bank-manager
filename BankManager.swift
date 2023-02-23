//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 은행 관리 업무: 모든 은행들은 아래와 같은 행동들을 한다.
// 추후 프로토콜로 변경해보기.
struct BankManager {
    // 손님 줄세우기
    // 여기서 waitingQueue에 들어오는 item 을 customer type으로 지정해도 괜찮을지? 아니면 여기서도 제네릭으로 표현해야 하는지?
    func addCustomer(in waitingQueue: WaitingManager<Customer>) {
        waitingQueue.enqueue(Customer())
    }
    
    func working(with waitingQueue: WaitingManager<Customer>, time: Double) {
        // dequeue에 사실 completionHandler를 넣을까 했음.
        _ = waitingQueue.dequeue()
        // completionHandler를 이용하면 dequeue 완료된 이후 아래 코드 넣어주면 되니깐
        sleep(UInt32(time))
    }
}

// 처음 사용자에게 띄워주는 메뉴
enum Menu: String {
    case open = "1"
    case close = "2"
}
