//
//  ExpressionTreeTestCases.swift
//  DataStructureTests
//
//  Created by piaojin on 2020/4/6.
//  Copyright © 2020 piaojin. All rights reserved.
//

import XCTest

class ExpressionTreeTestCases: XCTestCase {

    func testExpressionTree() {
        let tree = ExpressionTree(expression: "ab+cde+**")
        tree.printTree()
    }
}
