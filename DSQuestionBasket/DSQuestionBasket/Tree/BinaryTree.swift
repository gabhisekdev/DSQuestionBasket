//
//  BinaryTree.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 22/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

class BinaryTree<T: Comparable> {
    let rootNode: BinaryTreeNode<T>
    var maxLevel = 0
    
    init(rootNode: BinaryTreeNode<T>) {
        self.rootNode = rootNode
    }
}

class BinaryTreeNode<T: Comparable> {
    var value: T
    var leftChild: BinaryTreeNode<T>?
    var rightChild: BinaryTreeNode<T>?
    
    init(_ value: T,_ leftChild: BinaryTreeNode<T>?,_ rightChild: BinaryTreeNode<T>?) {
        self.value = value
        self.rightChild = rightChild
        self.leftChild = leftChild
    }
}

// MARK: Tree traversals
extension BinaryTree {
    func printLeftView() {
        maxLevel = 0
        leftView(rootNode: rootNode, level: 1)
    }
    
    func printRightView() {
        maxLevel = 0
        rightView(rootNode: rootNode, level: 1)
    }
    
    private func leftView(rootNode: BinaryTreeNode<T>?, level: Int) {
        guard let node = rootNode else { return }
        
        print("Level - \(level)")
        print("Max Level - \(maxLevel)")
        
        if maxLevel < level {
            print(node.value)
            maxLevel += 1
        }
        
        leftView(rootNode: node.leftChild, level: level + 1)
        leftView(rootNode: node.rightChild, level: level + 1)
    }
    
    private func rightView(rootNode: BinaryTreeNode<T>?, level: Int) {
        guard let node = rootNode else { return }
        
        if maxLevel < level {
            print(node.value)
            maxLevel += 1
        }
        
        rightView(rootNode: node.rightChild, level: level + 1)
        rightView(rootNode: node.leftChild, level: level + 1)
    }
}

struct MinMax {
    var isBST: Bool = true
    var size: Int = 0
    var min: Int = Int.min
    var max: Int = Int.max
}

extension BinaryTreeNode where T == Int {
    var isBST: Bool {
        isBinarySearchTree(node: self,max: Int.max, min: Int.min)
    }
    
    private func isBinarySearchTree(node: BinaryTreeNode<T>?, max: Int, min: Int) -> Bool {
        guard let currentNode = node else {
            return true
        }
        
        guard  currentNode.value < max && currentNode.value > min else {
            return false
        }
        
        return isBinarySearchTree(node: currentNode.leftChild, max: currentNode.value, min: min) &&
            isBinarySearchTree(node: currentNode.rightChild, max: max, min: currentNode.value)
    }
}

extension BinaryTreeNode where T == Int {
    var maxSizeBST: Int {
        largestNode(node: self).size
    }
    
    private func largestNode(node: BinaryTreeNode<T>?) -> MinMax {
        guard let currentNode = node else {
            return MinMax()
        }
        
        let leftMinMax = largestNode(node: currentNode.leftChild)
        let rightMinMax = largestNode(node: currentNode.rightChild)
                
        guard leftMinMax.isBST && rightMinMax.isBST && currentNode.isBST else {
             return MinMax(isBST: false, size: max(leftMinMax.size, rightMinMax.size), min: 0, max: 0)
        }
        
        let min = currentNode.leftChild == nil ? currentNode.value : leftMinMax.min
        let max = currentNode.rightChild == nil ? currentNode.value : rightMinMax.max
        
        return MinMax(isBST: true, size: leftMinMax.size + rightMinMax.size + 1, min: min, max: max)
    }
}
