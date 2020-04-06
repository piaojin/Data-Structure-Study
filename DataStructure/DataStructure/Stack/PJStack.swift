//
//  PJStack.swift
//  DataStructure
//
//  Created by piaojin on 2020/4/5.
//  Copyright © 2020 piaojin. All rights reserved.
//

import Cocoa

let emptyTOS: Int = -1

struct PJStack<T: Equatable> {
    
    let minSize: Int = 5
    
    var capacity: Int = 0 /**The max size of queue*/
    
    var size: Int {
        return array.count
    }
    
    var array: [T] = []
    
    var isEmpty: Bool {
        return size == 0
    }
    
    var isFull: Bool {
        return array.count == capacity
    }
    
    init(capacity: Int) {
        if capacity < minSize {
            fatalError("capacity \(capacity) should >= minSize of \(minSize)")
        }
        self.capacity = capacity
    }
    
    mutating func removeAll() {
        array.removeAll()
    }
    
    mutating func push(element: T) {
        if isFull {
            fatalError("PJStack is full.")
        } else {
            array.insert(element, at: 0)
        }
    }
    
    func topOfStack() -> T {
        if isEmpty {
            fatalError("PJStack is empty.")
        }
        
        if let first = array.first {
            return first
        } else {
            fatalError("Top is nil.")
        }
    }
    
    mutating func pop() {
        if isEmpty {
            fatalError("PJStack is empty.")
        }
        array.remove(at: 0)
    }
    
    mutating func topAndPop() -> T {
        if isEmpty {
            fatalError("PJStack is empty.")
        }
        
        if let first = array.first {
            array.remove(at: 0)
            return first
        } else {
            fatalError("Top is nil.")
        }
    }
}
