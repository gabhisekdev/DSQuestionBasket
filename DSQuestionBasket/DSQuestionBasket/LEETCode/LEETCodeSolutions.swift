//
//  LEETCodeSolutions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 19/04/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

struct LeetCodeSolutions {
    func solve() {
        testArray()
        testLinkedList()
        testSolutionTree()
        testRandomQuestions()
    }
}

extension LeetCodeSolutions {
    func testArray() {
        testPascalGetRow()
        testMoveZeroes()
    }
    
    func testPascalGetRow() {
        displayPrint("LEET:119 - Pascal get row") {
            print(SolutionArray().getPascalRow(0))
        }
    }
    
    func testMoveZeroes() {
        displayPrint("LEET:283 - Move zeroes") {
            var nums = [0,1,0,3,12]
            SolutionArray().moveZeroes(&nums)
            print(nums)
        }
    }
}

extension LeetCodeSolutions {
    func testLinkedList() {
        testSwapPair()
        testReverseLinkedList()
    }
    
    func testSwapPair() {
        displayPrint("Swap pair Linked list") {
            let listNode = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
            var nodePostSwap = SolutionLinkedList().swapPairsRecursively(listNode)
            
            while nodePostSwap != nil {
                print(nodePostSwap?.val)
                nodePostSwap = nodePostSwap?.next
            }
        }
    }
    
    func testReverseLinkedList() {
        displayPrint("LEET - Reverse linked list") {
            let listNode = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
            var reversedHead = SolutionLinkedList().reverseListRecursively(listNode)
            
            while reversedHead != nil {
                print(reversedHead?.val)
                reversedHead = reversedHead?.next
            }
        }
    }
}

extension LeetCodeSolutions {
    func testSolutionTree() {
        testSymmetry()
        testMaxDepthBST()
        testLevelOrder()
        testMaxDepthBST_TopDownApproach()
        testHasPathSum()
    }
    
    func testSymmetry() {
        let node = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
        displayPrint("Binary tree symmetry") {
            print(SolutionTree().isSymmetric(node))
        }
    }
    
    func testMaxDepthBST() {
        let node = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        displayPrint("Maximum depth") {
            print(SolutionTree().maxDepth_BottomUpApproach(node))
        }
    }
    
    func testMaxDepthBST_TopDownApproach() {
        let node = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        displayPrint("Maximum depth top down") {
            print(SolutionTreeMaxDepth().maxDepth(node))
        }
    }
    
    func testLevelOrder() {
        let node = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        displayPrint("Level Order") {
            print(SolutionTree().levelOrder(node))
        }
    }
    
    func testHasPathSum() {
        let seventh = TreeNode(7)
        let eighth = TreeNode(2)
        let ninth = TreeNode(2)
        let fourth = TreeNode(11, seventh, eighth)
        let fifth = TreeNode(13)
        let sixth = TreeNode(6, nil, ninth)
        let second = TreeNode(4, fourth, nil)
        let third = TreeNode(8, fifth, sixth)
        let node = TreeNode(5, second, third)
        
        displayPrint("Path sum") {
            print(SolutionPathSum().hasPathSum(node, 22))
        }
    }
}

extension LeetCodeSolutions {
    func testRandomQuestions() {
        SolutionLeetQuestions().maxProfit([7,1,5,3,6,4])
                
        let firstNode = ListNode(3)
        let secondNode = ListNode(2)
        let thirdNode = ListNode(0)
        let fourthNode = ListNode(-4)
        
        firstNode.next = secondNode
        secondNode.next = thirdNode
        thirdNode.next = fourthNode
        fourthNode.next = secondNode
        
        SolutionLeetQuestions().hasCycle(firstNode)
        testIntersectionLeetCode()
    }
    
    func testIntersectionLeetCode() {
        let a1Node = ListNode(4)
        let a2Node = ListNode(1)
        let a3Node = ListNode(8)
        let a4Node = ListNode(4)
        let a5Node = ListNode(5)
        
        let b1Node = ListNode(5)
        let b2Node = ListNode(6)
        let b3Node = ListNode(1)
        
        a1Node.next = a2Node
        a2Node.next = a3Node
        a3Node.next = a4Node
        a4Node.next = a5Node
        
        b1Node.next = b2Node
        b2Node.next = b3Node
        b3Node.next = a3Node
        
        displayPrint("Intersection of linked list") {
            print(SolutionLeetQuestions().getIntersectionNode(a1Node, b1Node)?.val)
        }
    }
}
