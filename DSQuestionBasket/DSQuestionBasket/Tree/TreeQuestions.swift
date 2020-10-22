//
//  TreeQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 08/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

struct TreeQuestions {
    func levelOrderTraversalInOneLine<T>(rootNode: BinaryTreeNode<T>) {
        var traversalQueue = Queue<BinaryTreeNode<T>>()
        
        traversalQueue.enqueue(rootNode)
        
        while !traversalQueue.isEmpty {
            let currentNode = traversalQueue.dequeue()
            print(currentNode?.value)
            
            if let leftNode = currentNode?.leftChild {
                traversalQueue.enqueue(leftNode)
            }
            
            if let rightNode = currentNode?.rightChild {
                traversalQueue.enqueue(rightNode)
            }
        }
    }
    
    func levelOrderTraversalPrintLevelByLevel<T>(rootNode: BinaryTreeNode<T>) {
        var firstQueue = Queue<BinaryTreeNode<T>>()
        var secondQueue = Queue<BinaryTreeNode<T>>()
        var currentNode: BinaryTreeNode<T>?
        var levelValues: String = ""
        
        firstQueue.enqueue(rootNode)
        
        while !firstQueue.isEmpty || !secondQueue.isEmpty {
            while !firstQueue.isEmpty {
                currentNode = firstQueue.dequeue()
                if let leftElement = currentNode?.leftChild {
                    secondQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.rightChild {
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
                if let leftElement = currentNode?.leftChild {
                    firstQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.rightChild {
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
    
    func leftViewOfBinaryTreeUsingQueue<T>(rootNode: BinaryTreeNode<T>) {
        var firstQueue = Queue<BinaryTreeNode<T>>()
        var secondQueue = Queue<BinaryTreeNode<T>>()
        var currentNode: BinaryTreeNode<T>?
        var queueElementNumber = 1
        
        firstQueue.enqueue(rootNode)
        
        while !firstQueue.isEmpty || !secondQueue.isEmpty {
            while !firstQueue.isEmpty {
                currentNode = firstQueue.dequeue()
                if let leftElement = currentNode?.leftChild {
                    secondQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.rightChild {
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
                if let leftElement = currentNode?.leftChild {
                    firstQueue.enqueue(leftElement)
                }
                
                if let rightElement = currentNode?.rightChild {
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
    func traversePreOrder<T>(rootNode: BinaryTreeNode<T>?) {
        guard let node = rootNode else { return }
        print("\(node.value)")
        traversePreOrder(rootNode: rootNode?.leftChild)
        traversePreOrder(rootNode: rootNode?.rightChild)
    }
    
    func traverseInOrder<T>(rootNode: BinaryTreeNode<T>?) {
        guard let node = rootNode else { return }
        traverseInOrder(rootNode: rootNode?.leftChild)
        print("\(node.value)")
        traverseInOrder(rootNode: rootNode?.rightChild)
    }
    
    func traversePostOrder<T>(rootNode: BinaryTreeNode<T>?) {
        guard let node = rootNode else { return }
        traversePostOrder(rootNode: rootNode?.leftChild)
        traversePostOrder(rootNode: rootNode?.rightChild)
        print("\(node.value)")
    }
}

extension TreeQuestions {
    func testTraversals() {
        let sevenNode = BinaryTreeNode(7, nil, nil)
        let sixNode = BinaryTreeNode(6, sevenNode, nil)
        let fiveNode = BinaryTreeNode(5, nil, nil)
        let fourNode = BinaryTreeNode(4, nil, nil)
        let twoNode = BinaryTreeNode(2, fourNode, fiveNode)
        let threeNode = BinaryTreeNode(3, sixNode, nil)
        let rootNode = BinaryTreeNode(1, twoNode, threeNode)
        
        print("\nInorder Traversal:")
        TreeQuestions().traverseInOrder(rootNode: rootNode)
        print("\nPostorder Traversal:")
        TreeQuestions().traversePostOrder(rootNode: rootNode)
        print("\nPreorder Traversal:")
        TreeQuestions().traversePreOrder(rootNode: rootNode)
        
        print("\nLevel order teaversal in one line:")
        TreeQuestions().levelOrderTraversalInOneLine(rootNode: rootNode)
        print("\nLevel order teaversal and print level by level:")
        TreeQuestions().levelOrderTraversalPrintLevelByLevel(rootNode: rootNode)
    }
}

extension TreeQuestions {
    func testBinaryTreeQuestions() {
        let fifteen = BinaryTreeNode(15, nil, nil)
        let eighteenLeaf = BinaryTreeNode(18, nil, nil)
        let twentyFive = BinaryTreeNode(25, nil, nil)
        let thirty = BinaryTreeNode(30, nil, nil)
        let sixty = BinaryTreeNode(60, nil, nil)
        let nineteen = BinaryTreeNode(19, nil, fifteen)
        let twenty = BinaryTreeNode(20, eighteenLeaf, twentyFive)
        let eighteen = BinaryTreeNode(18, nineteen, twenty)
        let fifty = BinaryTreeNode(50, thirty, sixty)
        let root = BinaryTreeNode(25, eighteen, fifty)
        
        let binaryTree = BinaryTree(rootNode: root)
        print("\nLeft view of the binary tree by recursion: ")
        binaryTree.printLeftView()
        
        print("\nLeft view of the tree by queue: ")
        TreeQuestions().leftViewOfBinaryTreeUsingQueue(rootNode: root)
        
        print("\nRight view of the binary tree by recursion: ")
        binaryTree.printRightView()
        
        print("\nBinary tree is \(root.isBST ? "a" : "not a") BST")
        print("\nLargest in BST in binary tree - \(root.maxSizeBST)")
    }
}
