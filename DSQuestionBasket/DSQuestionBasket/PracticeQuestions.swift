//
//  PracticeQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 18/02/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

struct PracticeQuestions {
    func startTesting() {
        let sevenNode = BinaryTreeNode(7, nil, nil)
        let sixNode = BinaryTreeNode(6, sevenNode, nil)
        let fiveNode = BinaryTreeNode(5, nil, nil)
        let fourNode = BinaryTreeNode(4, nil, nil)
        let twoNode = BinaryTreeNode(2, fourNode, fiveNode)
        let threeNode = BinaryTreeNode(3, sixNode, nil)
        let rootNode = BinaryTreeNode(1, twoNode, threeNode)
        
        testPrintLevelByLevel(root: rootNode)
    }
    
    func testPrintLevelByLevel<T>(root: BinaryTreeNode<T>) {
        var queue1 = Queue<BinaryTreeNode<T>>()
        var queue2 = Queue<BinaryTreeNode<T>>()
        var current: BinaryTreeNode<T>?
        queue1.enqueue(root)
        
        while !queue1.isEmpty || !queue2.isEmpty {
            while !queue1.isEmpty {
                current = queue1.dequeue()
                if let leftChild = current?.leftChild {
                    queue2.enqueue(leftChild)
                }
                
                if let rightChild = current?.rightChild {
                    queue2.enqueue(rightChild)
                }
                
                print(current?.value)
            }
            
            print("\n")
            while !queue2.isEmpty {
                current = queue2.dequeue()
                if let leftChild = current?.leftChild {
                    queue1.enqueue(leftChild)
                }
                
                if let rightChild = current?.rightChild {
                    queue1.enqueue(rightChild)
                }
                
                print(current?.value)
            }
        }
    }
}


