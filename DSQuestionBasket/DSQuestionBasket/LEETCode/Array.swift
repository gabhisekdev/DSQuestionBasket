//
//  Array.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 27/03/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

// MARK:
/*Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 Solution: https://www.youtube.com/watch?v=2MmGzdiKR9Y */
class SolutionArray {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSoFar = nums[0]
        var maxEndingHere = nums[0]
        
        for i in 1 ..< nums.count {
            maxEndingHere = Swift.max(nums[i], nums[i]+maxEndingHere)
            maxSoFar = Swift.max(maxEndingHere, maxSoFar)
        }
        
        return maxSoFar
    }
    
    func getPascalRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex >= 0 else { return [] }
        
        var row: [Int] = [1]
        if rowIndex == 0 {
            return row
        }
        
        for i in 1...rowIndex {
            var j = row.count - 1
            while j > 0 {
                row[j] = row[j-1] + row[j]
                j -= 1
            }
            
            row.append(1)
        }
        
        return row
    }
    
    func moveZeroes(_ nums: inout [Int]) {
            var zeroes = [Int]()
            
            for (index, num) in nums.enumerated() {
                if num == 0 {
                    nums.remove(at: index)
                    zeroes.append(0)
                }
            }
            
            nums.append(contentsOf: zeroes)
        }
}
