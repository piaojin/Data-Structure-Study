//
//  PJLink.swift
//  DataStructure
//
//  Created by piaojin on 2020/4/4.
//  Copyright © 2020 piaojin. All rights reserved.
//

import Cocoa

struct PJLinkError: Error {
    var errorInfor: String

    init(_ errorInfor: String) {
        self.errorInfor = errorInfor
    }
}

class PJNode<T: Equatable>: NSObject {
    var element: T
    
    var next: PJNode<T>?
    
    init(element: T, next: PJNode<T>? = nil) {
        self.element = element
        self.next = next
    }
}

struct PJLink<T: Equatable> {
    var head: PJNode<T>?
    
    var count: Int = 0
    
    func find(with element: T) -> PJNode<T>? {
        if element == head?.element {
            return head
        }
        
        var node: PJNode<T>? = head?.next
        
        while node != nil, node?.element != element {
            node = node?.next
        }
        
        return node
    }
    
    func findPrevious(of node: PJNode<T>) -> PJNode<T>? {
        var tempNode: PJNode<T>? = head
        
        if tempNode === node {
            return nil
        }
        
        while tempNode != nil, tempNode?.next !== node {
            tempNode = tempNode?.next
        }
        
        return tempNode
    }
    
    func node(at index: Int) -> PJNode<T>? {
        assert((index >= 0 && index < count), "index \(index) out of range \(count).")
        var tempNode: PJNode<T>? = head
        for i in 0..<count {
            if i == index {
                break
            }
            tempNode = tempNode?.next
        }
        return tempNode
    }
    
    func index(of node: PJNode<T>) -> Int? {
        for i in 0..<count {
            if self.node(at: i) === node {
                return i
            }
        }
        return nil
    }
    
    mutating func insert(node: PJNode<T>, atIndex: Int) {
        assert(atIndex >= 0, "atIndex should >= 0")
        if atIndex == 0 {
            if !isEmpty() {
                node.next = head
            }
            head = node
            count += 1
        } else {
            if isEmpty() {
                head = node
                count += 1
            } else if atIndex > count {
                append(node: node)
            } else {
                var tempNode: PJNode<T>? = head
                for i in 0..<count {
                    if i == atIndex - 1 {
                        node.next = tempNode?.next
                        tempNode?.next = node
                        break
                    }
                    tempNode = tempNode?.next
                }
                count += 1
            }
        }
    }
    
    mutating func append(node: PJNode<T>) {
        if isEmpty() {
            head = node
            count += 1
            return
        }
        var tempNode: PJNode<T>? = head
        while let n = tempNode, !isLast(node: n) {
            tempNode = tempNode?.next
        }
        tempNode?.next = node
        count += 1
    }
    
    @discardableResult
    mutating func remove(_ node: PJNode<T>) -> PJNode<T>? {
        var tempNode: PJNode<T>? = head
        
        if tempNode === node {
            head = head?.next
            count -= 1
            return node
        }
        
        while tempNode != nil, tempNode !== node {
            tempNode = tempNode?.next
        }
        
        if tempNode === node {
            let previousNode = findPrevious(of: node)
            previousNode?.next = node.next
            count -= 1
            return node
        } else {
            return nil
        }
    }
    
    @discardableResult
    mutating func remove(at index: Int) -> PJNode<T>? {
        assert(index >= 0 && index < count, "index \(index) out of range")
        var tempNode: PJNode<T>? = head
        var toRemovedNode: PJNode<T>?
        
        if index == 0 {
            toRemovedNode = head
            head = head?.next
            return toRemovedNode
        }
        
        for i in 0..<count {
            if i == index - 1 {
                toRemovedNode = tempNode?.next
                tempNode?.next = toRemovedNode?.next
                break
            }
            tempNode = tempNode?.next
        }
        return toRemovedNode
    }
    
    private func isEmpty() -> Bool {
        return head == nil
    }
    
    private func isLast(node: PJNode<T>) -> Bool {
        return node.next == nil
    }
    
    func printLink() {
        var node: PJNode<T>? = head
        var index: Int = 0
        while node != nil {
            print("index: \(index), node: \(String(describing: node?.element))")
            node = node?.next
            index += 1
        }
    }
}
