//
//  PJQueue.swift
//  DataStructure
//
//  Created by piaojin on 2020/4/5.
//  Copyright © 2020 piaojin. All rights reserved.
//

import Cocoa

/**
Queue
| | | | | |    8    |    6    |
             front      rear
*/

struct PJQueue<T: Equatable> {
    var capacity: Int = 0 /**The max size of queue*/
    var front: Int = 0 /**The initial value is 0*/
    var rear: Int = 0 /**The initial value is 0*/
    var size: Int = 0 /**Current size of queue*/
    /**[T] cannot create [T](repeating: T object, count: capacity), so use [T?]*/
    var array: [T?] = []
    
    /**front == rear or size == 0*/
    var isEmpty: Bool {
        return size == 0
    }
    
    /**(rear+1) % MAXSIZE == front or size == capacity*/
    var isFull: Bool {
        return size == capacity
    }
    
    init(capacity: Int) {
        self.capacity = capacity
        array = [T?](repeating: nil, count: capacity)
    }
    
    mutating func removeAll() {
        array.removeAll()
        front = 0
        rear = 0
    }
    
    /**Enter queue*/
    mutating func enQueue(element: T) {
        if isFull {
            fatalError("Queue is full")
        }
        array[rear] = element
        /*The purpose of adding 1 to rear and taking a remainder from Max is to realize the loop of array subscript.*/
        rear = (rear + 1) % capacity;
        size += 1
    }
    
    /**Out of queue*/
    mutating func frontAndDeQueue() -> T {
        if isEmpty {
            fatalError("Queue is empty.")
        }
        let data = array[front]
        /*The data is not really deleted, and then the empty location is reused in the form of overlay*/
        front = (front + 1) % capacity;
        size -= 1
        if let tempData = data {
            return tempData
        } else {
            fatalError("Data at front \(front) is nil.")
        }
    }
    
    func printQueue() {
        var tempSize = size
        var tempFront = front
        while tempSize > 0 {
            print(array[tempFront] ?? "nil")
            tempFront = (tempFront + 1) % capacity;
            tempSize -= 1
        }
    }
}
