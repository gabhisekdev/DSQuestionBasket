//
//  BinaryTree.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 22/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

class BinaryTree<T> {
    let rootNode: TreeNode<T>
    var maxLevel = 0
    
    init(rootNode: TreeNode<T>) {
        self.rootNode = rootNode
    }
    
    func printLeftView() {
        maxLevel = 0
        leftView(rootNode: rootNode, level: 1)
    }
    
    func printRightView() {
        maxLevel = 0
        rightView(rootNode: rootNode, level: 1)
    }
    
    private func leftView(rootNode: TreeNode<T>?, level: Int) {
        guard let node = rootNode else { return }
        
        if maxLevel < level {
            print(node.value)
            maxLevel += 1
        }
        
        leftView(rootNode: node.left, level: level + 1)
        leftView(rootNode: node.right, level: level + 1)
    }
    
    private func rightView(rootNode: TreeNode<T>?, level: Int) {
        guard let node = rootNode else { return }
        
        if maxLevel < level {
            print(node.value)
            maxLevel += 1
        }
        
        rightView(rootNode: node.right, level: level + 1)
        rightView(rootNode: node.left, level: level + 1)
    }
}
