//
//  ArrayQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 12/11/19.
//  Copyright © 2019 G Abhisek. All rights reserved.
//

import Foundation



extension Array where Element == Int {
    
    /*
     Find a triplet that sum to a given value
     Given an array and a value, find if there is a triplet in array whose sum is equal to the given value. If there is such a triplet present in array, then print the triplet and return true. Else return false. For example, if the given array is {12, 3, 4, 1, 6, 9} and given sum is 24, then there is a triplet (12, 3 and 9) present in array whose sum is 24.
     */
    
    // Worst case time complexity - O(n^2)
    func isThereAnyTriplets(for sum: Int)-> (Bool, Int, Int, Int) {
        let sortedArray = sorted { $0 < $1 }
        var i = 0
        var j = 0
        
        for (index, element) in sortedArray.enumerated() {
            i = index+1
            j = sortedArray.count-1
            
            while i != j {
                if element + sortedArray[i] + sortedArray[j] == sum {
                    return (true, element, sortedArray[i], sortedArray[j])
                } else if element + sortedArray[i] + sortedArray[j] > sum {
                    j -= 1
                } else {
                    i += 1
                }
            }
            
        }
        
        return (false, 0, 0, 0)
    }
    
    /*
     Count Triplets such that one of the numbers can be written as sum of the other two.
     Input : A[] = {1, 2, 3, 4, 5}
     Output : 4
     The valid triplets are:
     (1, 2, 3), (1, 3, 4), (1, 4, 5), (2, 3, 5)
     
     Input : A[] = {1, 1, 1, 2, 2}
     Output : 6
     */
    
    
}
