//
//  ArrayQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 29/02/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

// MARK: Bubble Sort
extension Array where Element: Comparable {
    mutating func bubbleSort() {
        for i in 0..<count-1 {
            for j in 0..<(count-i-1) {
                if self[j] > self[j+1] {
                    swapAt(j, j+1)
                }
            }
        }
    }
}

// MARK: Selection sort
extension Array where Element: Comparable {
    mutating func selectionSort() {
        for i in 0..<count-1 {
            // We did not do this to the end of the array because 
            var min = i
            for j in i+1...count-1 {
                if self[j] < self[min] {
                    min = j
                }
            }
            
            swapAt(i, min)
        }
    }
}

// MARK: Insertion sort
extension Array where Element: Comparable {
    // Swapping has more number of operations so slightly
    mutating func insertionSortSwap() {
        for x in 1..<count {
            var y = x
            while y > 0 && self[y] < self[y - 1] {
                swapAt(y - 1, y)
                y -= 1
            }
        }
    }
    
    mutating func insertionSortShift() {
        for x in 1..<count {
            var y = x
            let minNum = self[y]
            
            while y > 0 && minNum < self[y-1] {
                self[y] = self[y-1]
                y-=1
            }
            
            if minNum != self[y] {
                self[y] = minNum
            }
        }
    }
}

// MARK: Quick sort
extension Array where Element: Comparable {
    mutating func quickSort() {
        quickSort(lowerBound: 0, upperBound: count-1)
    }
    
    private mutating func quickSort(lowerBound: Int, upperBound: Int) {
        if lowerBound >= upperBound {
            return
        }
        
        let pivotElementLocation = partition(lowerBound: lowerBound, upperBound: upperBound)
        
        quickSort(lowerBound: 0, upperBound: pivotElementLocation-1)
        quickSort(lowerBound: pivotElementLocation+1, upperBound: upperBound)
    }
    
    private mutating func partition(lowerBound: Int, upperBound: Int) -> Int {
        let pivotElement = self[lowerBound]
        var start = lowerBound
        var end = upperBound
        
        while start < end {
            while self[start] <= pivotElement {
                start += 1
            }
            
            while self[end] > pivotElement {
                end -= 1
            }
            
            if start < end {
                swapAt(start, end)
            }
        }
        
        swapAt(lowerBound, end)
        return end
    }
    
}

// MARK: Merge Sort
extension Array where Element: Comparable {
    mutating func mergeSort() {
        mergeSort(lb: 0, ub: count-1)
    }
    
    private mutating func mergeSort(lb: Int, ub: Int) {
        if lb < ub {
            let mid = (lb+ub)/2
            mergeSort(lb: lb, ub: mid)
            mergeSort(lb: mid+1, ub: ub)
            merge(lb: lb, mid: mid, ub: ub)
        }
    }
    
    mutating func merge(lb: Int, mid: Int, ub: Int) {
        var sortedArray: [Element] = []
        var firstArrayPointer = lb
        var secondArrayPointer = mid+1
        
        while firstArrayPointer <= mid && secondArrayPointer <= ub {
            let firstArrayElement = self[firstArrayPointer]
            let secondArrayElement = self[secondArrayPointer]
            
            if firstArrayElement <= secondArrayElement {
                sortedArray.append(firstArrayElement)
                firstArrayPointer += 1
            } else {
                sortedArray.append(secondArrayElement)
                secondArrayPointer += 1
            }
        }
        
        while firstArrayPointer <= mid {
            let firstArrayElement = self[firstArrayPointer]
            sortedArray.append(firstArrayElement)
            firstArrayPointer += 1
        }
        
        while secondArrayPointer <= mid {
            let secondArrayElement = self[firstArrayPointer]
            sortedArray.append(secondArrayElement)
            secondArrayPointer += 1
        }
        
        for (index, element) in sortedArray.enumerated() {
            remove(at: lb+index)
            insert(element, at: lb+index)
        }
    }
    
}

// MARK: Find subarray
extension Array where Element == Int {
    
    /*
     Question: Given an unsorted array of integers, find a subarray which adds to a given number. If there are more than one subarrays with the sum as the given number, print any of them.
     
     Input: arr[] = {10, 2, -2, -20, 10}, sum = -10
     Output: Sum found between indexes 0 to 3
     
     */
    
    func findSubarray(with sum: Int) -> (startIndex: Int, endIndex: Int)? {
        print("\nArray to test \(self)")
        var currentSumMap: [String: Int] = [:]
        var currentSum = 0
        
        for (index, element) in enumerated() {
            currentSum+=element
            
            if currentSum == sum {
                return (startIndex: 0, endIndex: index)
            }
            
            if let previousIndexOfStartIndex = currentSumMap["\(currentSum - sum)"] {
                return (startIndex: previousIndexOfStartIndex + 1, endIndex: index)
            }
            
            currentSumMap["\(currentSum)"] = index
        }
        
        return nil
    }
    
}

// MARK: Sort array 0's 1's and 2's
/* Given an array of size N containing only 0s, 1s, and 2s; sort the array in ascending order. */
extension Array {
    mutating func sort0s1s2s() {
        
    }
}
