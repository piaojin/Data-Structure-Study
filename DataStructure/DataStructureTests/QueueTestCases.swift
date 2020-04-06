//
//  QueueTestCases.swift
//  DataStructureTests
//
//  Created by piaojin on 2020/4/5.
//  Copyright © 2020 piaojin. All rights reserved.
//

import XCTest

class QueueTestCases: XCTestCase {

    func testEmptyAndFull() {
        var queue: PJQueue = PJQueue<Int>(capacity: 6)
        
        XCTAssert(queue.isEmpty, "Test empty and full failure")
        
        for i in 0..<queue.capacity {
            queue.enQueue(element: i)
        }
        
        queue.printQueue()
        
        XCTAssert(queue.isFull && queue.size == queue.capacity, "Test empty and full failure")
    }
    
    func testEnQueue() {
        var queue: PJQueue = PJQueue<Int>(capacity: 6)
        queue.enQueue(element: 0)
        queue.enQueue(element: 1)
        
        XCTAssert(queue.size == 2, "Test enQueue failure")
    }
    
    func testDeQueue() {
        var queue: PJQueue = PJQueue<Int>(capacity: 6)
        
        queue.enQueue(element: 0)
        queue.enQueue(element: 1)
        
        XCTAssert(queue.frontAndDeQueue() == 0, "Test enQueue failure")
        XCTAssert(queue.frontAndDeQueue() == 1 && queue.isEmpty, "Test enQueue failure")
    }
}
