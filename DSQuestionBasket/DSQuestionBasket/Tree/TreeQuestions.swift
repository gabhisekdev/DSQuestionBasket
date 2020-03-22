//
//  TreeQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 08/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

enum PrintOrder {
    case singleLine
    case levelByLevel
}

struct TreeQuestions {
    func levelOrderTraversalInOneLine<T>(rootNode: TreeNode<T>?) {
        guard let node = rootNode else { return }
        var traversalQueue = Queue<TreeNode<T>>()
        
        traversalQueue.enqueue(node)
        
        while !traversalQueue.isEmpty {
            let currentNode = traversalQueue.dequeue()
            print(currentNode?.value)
            
            if let leftNode = currentNode?.left {
                traversalQueue.enqueue(leftNode)
            }
            
            if let rightNode = currentNode?.right {
                traversalQueue.enqueue(rightNode)
            }
        }
    }
    
    func levelOrderTraversalPrintLevelByLevel<T>(rootNode: TreeNode<T>?) {
        guard let node = rootNode else { return }
        var firstQueue = Queue<TreeNode<T>>()
        var secondQueue = Queue<TreeNode<T>>()
        var currentNode: TreeNode<T>?
        var levelValues: String = ""
        
        firstQueue.enqueue(node)
        
        while !firstQueue.isEmpty || !secondQueue.isEmpty {
            while !firstQueue.isEmpty {
                currentNode = firstQueue.dequeue()
                if let leftElement = currentNode?.left {
                    secondQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.right {
                    secondQueue.enqueue(rightElement)
                }
                if let currNode = currentNode {
                    levelValues += "\(currNode.value)"
                }
            }
            print(levelValues)
            levelValues = ""
            
            while !secondQueue.isEmpty {
                currentNode = secondQueue.dequeue()
                if let leftElement = currentNode?.left {
                    firstQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.right {
                    firstQueue.enqueue(rightElement)
                }
                
                if let currNode = currentNode {
                    levelValues += "\(currNode.value)"
                }
            }
            print(levelValues)
            levelValues = ""
        }
    }
    
    func leftViewOfBinaryTreeUsingQueue<T>(rootNode: TreeNode<T>?) {
        guard let node = rootNode else { return }
        var firstQueue = Queue<TreeNode<T>>()
        var secondQueue = Queue<TreeNode<T>>()
        var currentNode: TreeNode<T>?
        var queueElementNumber = 1
        
        firstQueue.enqueue(node)
        
        while !firstQueue.isEmpty || !secondQueue.isEmpty {
            while !firstQueue.isEmpty {
                currentNode = firstQueue.dequeue()
                if let leftElement = currentNode?.left {
                    secondQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.right {
                    secondQueue.enqueue(rightElement)
                }
                
                if queueElementNumber == 1 {
                    if let currNode = currentNode {
                        print(currNode.value)
                    }
                }
                queueElementNumber += 1
            }
            queueElementNumber = 1
            
            while !secondQueue.isEmpty {
                currentNode = secondQueue.dequeue()
                if let leftElement = currentNode?.left {
                    firstQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.right {
                    firstQueue.enqueue(rightElement)
                }
                
                if queueElementNumber == 1 {
                    if let currNode = currentNode {
                        print(currNode.value)
                    }
                }
                queueElementNumber += 1
            }
            queueElementNumber = 1
        }
    }
    
}

// MARK: DFS traversals
extension TreeQuestions {
    func traversePreOrder<T>(rootNode: TreeNode<T>?) {
        guard let node = rootNode else { return }
        print("\(node.value)")
        traversePreOrder(rootNode: rootNode?.left)
        traversePreOrder(rootNode: rootNode?.right)
    }
    
    func traverseInOrder<T>(rootNode: TreeNode<T>?) {
        guard let node = rootNode else { return }
        traverseInOrder(rootNode: rootNode?.left)
        print("\(node.value)")
        traverseInOrder(rootNode: rootNode?.right)
    }
    
    func traversePostOrder<T>(rootNode: TreeNode<T>?) {
        guard let node = rootNode else { return }
        traversePostOrder(rootNode: rootNode?.left)
        traversePostOrder(rootNode: rootNode?.right)
        print("\(node.value)")
    }
}
