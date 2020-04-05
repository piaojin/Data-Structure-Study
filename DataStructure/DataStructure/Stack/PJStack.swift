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
    var size: Int = 0
    var top: Int = emptyTOS
    var array: [T] = []
    
    init(size: Int) {
        if size >= minSize {
            fatalError("size \(size) should >= minSize of \(minSize)")
        }
        self.size = size
    }
    
    func isEmpty() -> Bool {
        return top == emptyTOS
    }
    
    func isFull() -> Bool {
        return top == size - 1
    }
    
    mutating func removeAll() {
        array.removeAll()
        top = emptyTOS
    }
    
    mutating func push(element: T) {
        if isFull() {
            fatalError("PJStack is full.")
        }
        if !isFull() {
            array.append(element)
            top += 1
        }
    }
    
    func topOfStack() -> T {
        if isEmpty() {
            fatalError("PJStack is empty.")
        }
        return array[top]
    }
    
    mutating func pop() {
        if isEmpty() {
            fatalError("PJStack is empty.")
        }
        top -= 1
    }
    
    mutating func topAndPop() -> T {
        if isEmpty() {
            fatalError("PJStack is empty.")
        }
        let data = array[top]
        top -= 1
        return data
    }
}
