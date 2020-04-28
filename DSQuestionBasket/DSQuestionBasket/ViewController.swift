//
//  ViewController.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 21/12/19.
//  Copyright © 2019 G Abhisek. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController  {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testArrayQuestions()
        testTreeQuestions()
    }

}

extension ViewController {
    func testArrayQuestions() {
        testSubArray()
        testBubbleSort()
        testSelectionSort()
        testInsertionSortSwap()
        testInsertionSortShifting()
        testQuickSort()
        testMergeSort()
    }
    
    func testSubArray() {
        func findAndPrintSubArrayIndex(array: [Int], sum: Int) {
            if let subArrayIndexes = array.findSubarray(with: sum) {
                print("Subarray found at indexes - \(subArrayIndexes)")
            } else {
                print("No subarray")
            }
        }
        
        let testArray = [10, 2, -2, -20, 10]
        findAndPrintSubArrayIndex(array: testArray, sum: -10)
        findAndPrintSubArrayIndex(array: testArray, sum: 5)
        
        let testArray2 = [1, 4, 20, 3, 10, 5]
        findAndPrintSubArrayIndex(array: testArray2, sum: 33)
    }
    
    func testBubbleSort() {
        var testArray = [7, 8, 9, 5, 6, 2]
        print("\nBubble sort of the array - \(testArray) is")
        testArray.bubbleSort()
        print(testArray)
    }
    
    func testSelectionSort() {
        var testArray = [4, 2, 9, 10, 5]
        print("\nSelection sort of the array - \(testArray) is")
        testArray.selectionSort()
        print(testArray)
    }
    
    func testInsertionSortSwap() {
        var testArray = [4, 4, 2, 9, 10, 5]
        print("\nInsertion sort by swap of the array - \(testArray) is")
        testArray.insertionSortSwap()
        print(testArray)
    }
    
    func testInsertionSortShifting() {
        var testArray = [4, 2, 9, 10, 5]
        print("\nInsertion sort by shifting of the array - \(testArray) is")
        testArray.insertionSortShift()
        print(testArray)
    }
    
    func testQuickSort() {
        var testArray = [7, 6, 10, 5, 7]
        print("\nQuick sort of the array - \(testArray) is")
        testArray.quickSort()
        print(testArray)
    }
    
    func testMergeSort() {
        var testArray = [8, 5, 3, 4, 1, 10]
        print("\nMerge sort of the array - \(testArray) is")
        testArray.mergeSort()
        print(testArray)
    }
}

extension ViewController {
    func testTreeQuestions() {
        let rootNode = TreeNode(value: 1)
        rootNode.left = TreeNode(value: 2)
        rootNode.right = TreeNode(value: 3)
        rootNode.left?.left = TreeNode(value: 4)
        rootNode.left?.right = TreeNode(value: 5)
        rootNode.right?.left = TreeNode(value: 6)
        rootNode.right?.right = TreeNode(value: 7)
        
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
        
        print("\nLeft view of the tree by queue: ")
        TreeQuestions().leftViewOfBinaryTreeUsingQueue(rootNode: rootNode)
        
        testBinaryTreeQuestions()
    }
    
    private func testBinaryTreeQuestions() {
        let rootNode = TreeNode(value: 20)
        rootNode.left = TreeNode(value: 10)
        rootNode.right = TreeNode(value: 25)
        rootNode.left?.left = TreeNode(value: 8)
        rootNode.left?.right = TreeNode(value: 12)
        rootNode.right?.left = TreeNode(value: 23)
        rootNode.right?.right = TreeNode(value: 27)
        
        let binaryTree = BinaryTree(rootNode: rootNode)
        print("\nLeft view of the binary tree by recursion: ")
        binaryTree.printLeftView()
        
        print("\nRight view of the binary tree by recursion: ")
        binaryTree.printRightView()
        
        print("\nBinary tree is \(binaryTree.isBST ? "a" : "not a") BST")
        
        getLargestBinaryTree()
    }
    
    private func getLargestBinaryTree() {
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
        
        print("\nLargest in BST in binary tree - \(root.maxSizeBST)")
    }
    
}
