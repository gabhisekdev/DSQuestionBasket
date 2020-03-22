//
//  ArrayQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 29/02/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

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
