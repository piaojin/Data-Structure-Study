//
//  ExpressionTree.swift
//  DataStructure
//
//  Created by piaojin on 2020/4/5.
//  Copyright © 2020 piaojin. All rights reserved.
//

import Cocoa

class ExpressionTreeNode: NSObject {
    var element: Character
    var left: ExpressionTreeNode?
    var right: ExpressionTreeNode?
    var isOperator = false
    
    init(data: Character) {
        self.element = data
    }
}

/**
Expression tree 表达式树
expression: ab+cde+** 后缀表达式
*/

class ExpressionTree: NSObject {
    var node: ExpressionTreeNode?
    var expression: String
    var stack: PJStack<ExpressionTreeNode>
    
    init(expression: String) {
        if expression.isEmpty {
            fatalError("expression cannot be empty.")
        }
        
        self.expression = expression
        stack = PJStack<ExpressionTreeNode>(capacity: expression.count)
        
        for (_, c) in expression.enumerated() {
            let node = ExpressionTreeNode(data: c)
            
            if let unicodeValue = c.unicodeScalars.first?.value {
                //if c is a~z A~Z then push to stack else c as operator
                if isalpha(Int32(unicodeValue)) != 0 {
                    
                } else {
                    node.isOperator = true
                    if !stack.isEmpty {
                        let treeA = stack.topAndPop()
                        node.left = treeA
                    }
                    
                    if !stack.isEmpty {
                        let treeB = stack.topAndPop()
                        node.right = treeB
                    }
                }
                stack.push(element: node)
            } else {
                fatalError("Some chars in expression are not unicode.")
            }
        }
        
        if !stack.isEmpty {
            node = stack.topOfStack()
        }
    }
    
    func printTree() {
        if stack.isEmpty {
            return
        }
        
        printTreeNode(node)
        print("")
    }
    
    private func printTreeNode(_ node: ExpressionTreeNode?) {
        if node == nil {
            return
        }
        if node?.isOperator == true {
           print("(", terminator: "")
        }
        printTreeNode(node?.right)
        print(node?.element ?? "nil", terminator: "")
        printTreeNode(node?.left)
        if node?.isOperator == true {
           print(")", terminator: "")
        }
    }
}
