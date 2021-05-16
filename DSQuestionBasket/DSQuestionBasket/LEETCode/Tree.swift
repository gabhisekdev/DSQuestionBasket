//
//  Tree.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 27/03/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class SolutionTree {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return symmetricHelper(leftNode: root?.left, rightNode: root?.right)
    }
    
    func symmetricHelper(leftNode: TreeNode?, rightNode: TreeNode?) -> Bool {
        if leftNode == nil && rightNode == nil {
            return true
        }
        
        return symmetricHelper(leftNode: leftNode?.left, rightNode: rightNode?.right) && symmetricHelper(leftNode: leftNode?.right, rightNode: rightNode?.left)
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var nodeList: [Int] = []
        
        if let node = root {
            nodeList.append(contentsOf: inorderTraversal(node.left))
            nodeList.append(node.val)
            nodeList.append(contentsOf: inorderTraversal(node.right))
        }
        
        return nodeList
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var vals: [Int] = []
        
        if let node = root {
            vals.append(contentsOf: postorderTraversal(node.left))
            vals.append(contentsOf: postorderTraversal(node.right))
            vals.append(node.val)
        }
        
        return vals
    }
    
    func maxDepth_BottomUpApproach(_ root: TreeNode?) -> Int {
        var maxDepthVal = 0
        
        if let node = root {
            let leftDepth = maxDepth_BottomUpApproach(node.left)
            let rightDepth = maxDepth_BottomUpApproach(node.right)
            let max = leftDepth > rightDepth ? leftDepth : rightDepth
            maxDepthVal = max + 1
        }
        
        return maxDepthVal
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var allValues: [[Int]] = []
        
        guard let rootNode = root else {
            return allValues
        }
        
        var firstQueue: [TreeNode] = []
        var secondQueue: [TreeNode] = []
        var current: TreeNode = rootNode
        firstQueue.append(rootNode)
        
        while firstQueue.isNotEmpty || secondQueue.isNotEmpty {
            var values = [Int]()
            while firstQueue.isNotEmpty {
                current = firstQueue.removeFirst()
                
                if let left = current.left {
                    secondQueue.append(left)
                }
                
                if let right = current.right {
                    secondQueue.append(right)
                }
                
                values.append(current.val)
            }
            
            if values.isNotEmpty {
                allValues.append(values)
                values = []
            }
            
            while secondQueue.isNotEmpty {
                current = secondQueue.removeFirst()
                
                if let left = current.left {
                    firstQueue.append(left)
                }
                
                if let right = current.right {
                    firstQueue.append(right)
                }
                
                values.append(current.val)
            }
            
            if values.isNotEmpty {
                allValues.append(values)
                values = []
            }
        }
        
        return allValues
    }
}

class SolutionTreeMaxDepth {
    var answer = 0
    
    func maxDepth(_ root: TreeNode?) -> Int {
        maxDepthHelper(root, depth: answer+1)
        return answer
    }
    
    func maxDepthHelper(_ root: TreeNode?, depth: Int) {
        guard let node = root else {
            return
        }
        
        if node.left == nil && node.right == nil {
            answer = max(answer, depth)
        }
        
        maxDepthHelper(node.left, depth: depth+1)
        maxDepthHelper(node.right, depth: depth+1)
    }
}

class SolutionPathSum {
    var isPathSumAvailable = false
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return isPathSumAvailable
        }
        
        hasPathSumHelper(root, targetSum, 0)
        return isPathSumAvailable
    }
    
    private func hasPathSumHelper(_ root: TreeNode?, _ targetSum: Int, _ sumTillNow: Int) {
        guard let node = root else {
            return
        }
        
        let sum = sumTillNow + node.val
        if sum == targetSum && node.left == nil && node.right == nil {
            isPathSumAvailable = true
            return
        }
        
        hasPathSumHelper(node.left, targetSum, sum)
        hasPathSumHelper(node.right, targetSum, sum)
    }
}


extension Array {
    var isNotEmpty: Bool {
        !isEmpty
    }
}
