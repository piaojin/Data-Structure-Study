//
//  LinkTestCases.swift
//  DataStructureTests
//
//  Created by piaojin on 2020/4/4.
//  Copyright © 2020 piaojin. All rights reserved.
//

import XCTest

class LinkTestCases: XCTestCase {
    
    func testAppend() {
        var link: PJLink<Int> = PJLink<Int>()
        let count: Int = 6
        append(link: &link, count: count)
        
        link.printLink()
        
        for i in 0..<count {
            if let node = link.find(with: i) {
                let index = link.index(of: node)
                XCTAssert(index == i, "Test append failure, index \( String(describing: index)) != i(\(i))")
            }
        }
    }
    
    func testInsert() {
        var link: PJLink<Int> = PJLink<Int>()
        let count: Int = 6
        append(link: &link, count: count)
        
        let newHeadNode = PJNode<Int>(element: -1)
        link.insert(node: newHeadNode, atIndex: 0)
        
        XCTAssert(link.head === newHeadNode, "Test insert failure, link head \(String(describing: link.head)) != newHeadNode(\(newHeadNode))")
        
        let midIndex = link.count / 2
        let midNode = PJNode<Int>(element: midIndex)
        link.insert(node: midNode, atIndex: midIndex)
        
        let midNodeOfLink = link.node(at: midIndex)
        XCTAssert(link.node(at: midIndex) === midNode, "Test insert failure, midNode \(String(describing: midNodeOfLink)) != midNode(\(midNode))")
        
        let overRangeNode = PJNode<Int>(element: link.count + 1)
        link.insert(node: overRangeNode, atIndex: link.count + 1)
        let lastNodeOfLink = link.node(at: link.count - 1)
        XCTAssert(link.node(at: link.count - 1) === overRangeNode, "Test insert failure, link last node \(String(describing: lastNodeOfLink)) != overRangeNode(\(overRangeNode))")
    }
    
    func testRemoveWithNode() {
        var link: PJLink<Int> = PJLink<Int>()
        let count: Int = 6
        append(link: &link, count: count)
        
        if let head = link.head {
            if let removedHead = link.remove(head) {
                XCTAssert(removedHead === head && link.head !== head, "Test remove with node failure")
            } else {
                XCTAssert(false, "Test remove with node failure")
            }
        } else {
            XCTAssert(false, "Test remove with node failure")
        }
        
        if let lastNode = link.node(at: link.count - 1) {
            if let removedLastNode = link.remove(lastNode) {
                XCTAssert(removedLastNode === lastNode && removedLastNode !== link.node(at: link.count - 1), "Test remove with node failure")
            } else {
                XCTAssert(false, "Test remove with node failure")
            }
        }
        
        if let midNode = link.node(at: link.count / 2) {
            if let removedMidNode = link.remove(midNode) {
                XCTAssert(link.index(of: removedMidNode) == nil, "Test remove with node failure")
            } else {
                XCTAssert(false, "Test remove with node failure")
            }
        } else {
            XCTAssert(false, "Test remove with node failure")
        }
    }
    
    func testRemoveAtIndex() {
        var link: PJLink<Int> = PJLink<Int>()
        let count: Int = 6
        append(link: &link, count: count)
        
        if let head = link.head {
            if let removedHead = link.remove(at: 0) {
                XCTAssert(removedHead === head && link.head !== head, "Test remove at index failure")
            } else {
                XCTAssert(false, "Test remove at index failure")
            }
        } else {
            XCTAssert(false, "Test remove at index failure")
        }
        
        if let lastNode = link.node(at: link.count - 1) {
            if let removedLastNode = link.remove(at: link.count - 1) {
                XCTAssert(removedLastNode === lastNode && removedLastNode !== link.node(at: link.count - 1), "Test remove at index failure")
            } else {
                XCTAssert(false, "Test remove at index failure")
            }
        }
        
        if let removedMidNode = link.remove(at: link.count / 2) {
            XCTAssert(link.index(of: removedMidNode) == nil, "Test remove at index failure")
        } else {
            XCTAssert(false, "Test remove at index failure")
        }
    }
    
    func testFind() {
        var link: PJLink<Int> = PJLink<Int>()
        let count: Int = 6
        append(link: &link, count: count)
        
        XCTAssert(link.find(with: 0)?.element == 0, "Test find failure")
        
        XCTAssert(link.find(with: link.count - 1)?.element == link.count - 1, "Test find failure")
        
        XCTAssert(link.find(with: link.count / 2)?.element == link.count / 2, "Test find failure")
    }
    
    private func append(link: inout PJLink<Int>, count: Int) {
        for i in 0..<count {
            let node = PJNode<Int>(element: i)
            link.append(node: node)
        }
        
        XCTAssert(link.count == count, "Test append failure, link count \(link.count) != count(\(count))")
    }
}
