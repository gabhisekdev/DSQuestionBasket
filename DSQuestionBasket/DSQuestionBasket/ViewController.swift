//
//  ViewController.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 21/12/19.
//  Copyright © 2019 G Abhisek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testArrayQuestions()
        testTreeQuestions()
    }

}

extension ViewController {
    func testArrayQuestions() {
        testSubArray() 
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
        
        print("\n Inorder Traversal:")
        TreeQuestions().traverseInOrder(rootNode: rootNode)
        print("\n Postorder Traversal:")
        TreeQuestions().traversePostOrder(rootNode: rootNode)
        print("\n Preorder Traversal:")
        TreeQuestions().traversePreOrder(rootNode: rootNode)
        
        print("\n Level order teaversal in one line:")
        TreeQuestions().levelOrderTraversalInOneLine(rootNode: rootNode)
        print("\n Level order teaversal and print level by level:")
        TreeQuestions().levelOrderTraversalPrintLevelByLevel(rootNode: rootNode)
        
        print("\n Left view of the tree by queue: ")
        TreeQuestions().leftViewOfBinaryTreeUsingQueue(rootNode: rootNode)
        
        let binaryTree = BinaryTree(rootNode: rootNode)
        print("\n Left view of the tree by recursion: ")
        binaryTree.printLeftView()
        
        print("\n Right view of the tree by recursion: ")
        binaryTree.printRightView()
    }
    
}
