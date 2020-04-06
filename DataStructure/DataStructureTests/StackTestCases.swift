//
//  StackTestCases.swift
//  DataStructureTests
//
//  Created by piaojin on 2020/4/5.
//  Copyright © 2020 piaojin. All rights reserved.
//

import XCTest

class StackTestCases: XCTestCase {

    func testEmptyAndFull() {
        var stack = PJStack<Int>(capacity: 5)
        
        XCTAssert(stack.isEmpty, "Test empty and full failure")
        
        for i in 0..<stack.capacity {
            stack.push(element: i)
        }
        
        XCTAssert(stack.isFull, "Test empty and full failure")
    }
    
    func testRemoveAll() {
        var stack = PJStack<Int>(capacity: 5)
        
        for i in 0..<stack.capacity {
            stack.push(element: i)
        }
        
        XCTAssert(stack.isFull, "Test removeAll failure")
        
        stack.removeAll()
        
        XCTAssert(stack.isEmpty, "Test removeAll failure")
    }
    
    func testPushAndPop() {
        var stack = PJStack<Int>(capacity: 5)
        
        stack.push(element: 6)
        
        XCTAssert(stack.topAndPop() == 6, "Test push and pop failure")
    }
}
