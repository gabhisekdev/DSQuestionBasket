//
//  ViewController.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 21/12/19.
//  Copyright © 2019 G Abhisek. All rights reserved.
//

import UIKit

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
        displayPrint("Bubble sort") {
            testBubbleSort()
        }
        
        displayPrint("SubArray") {
            testSubArray()
        }
        
        displayPrint("Selection sort") {
            testSelectionSort()
        }
        
        displayPrint("Insertion sort via swap") {
            testInsertionSortSwap()
        }
        
        displayPrint("Insertion sort via shifting") {
            testInsertionSortShifting()
        }
        
        displayPrint("Quick sort") {
            testQuickSort()
        }
                
        displayPrint("Merge sort") {
            testMergeSort()
        }
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
        print("\nTest array - \(testArray)")
        testArray.bubbleSort()
        print(testArray)
    }
    
    func testSelectionSort() {
        var testArray = [4, 2, 9, 10, 5]
        print("\nTest array - \(testArray)")
        testArray.selectionSort()
        print(testArray)
    }
    
    func testInsertionSortSwap() {
        var testArray = [4, 4, 2, 9, 10, 5]
        print("\nTest array - \(testArray)")
        testArray.insertionSortSwap()
        print(testArray)
    }
    
    func testInsertionSortShifting() {
        var testArray = [4, 2, 9, 10, 5]
        print("\nTest array - \(testArray)")
        testArray.insertionSortShift()
        print(testArray)
    }
    
    func testQuickSort() {
        var testArray = [5, 10, 11,12, 9]
        print("\nTest array - \(testArray)")
        //testArray.quickSort()
        print(testArray)
    }
    
    func testMergeSort() {
        var testArray = [8, 5, 3, 4, 1, 10]
        print("\nTest array - \(testArray)")
        testArray.mergeSort()
        print(testArray)
    }
}

extension ViewController {
    func testTreeQuestions() {
        TreeQuestions().testTraversals()
        TreeQuestions().testBinaryTreeQuestions()
    }
}
