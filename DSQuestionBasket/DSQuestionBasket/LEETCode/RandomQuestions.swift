//
//  RandomQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 01/05/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

struct SolutionLeetQuestions {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        return 0
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = Int.max
        
        for i in 0..<prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            } else if prices[i] - minPrice > maxProfit {
                maxProfit = prices[i] - minPrice
            }
        }
        
        return maxProfit
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        var tracker: [Int: Int] = [:]
        
        for num in nums {
            if tracker[num] != nil {
                tracker.removeValue(forKey: num)
            } else {
                tracker[num] = 1
            }
        }
        
        return tracker.first?.key ?? 0
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let llNode = head else {
            return false
        }
        
        var trackHash: [Int: Int] = [llNode.val: 1]
        var iteratingNode = head
        
        while iteratingNode != nil {
            if let val = iteratingNode?.next?.val {
                if trackHash[val] != nil {
                    return true
                }
                
                trackHash[val] = 1
            } else {
                break
            }
            
            iteratingNode = iteratingNode?.next
        }
        
        return false
    }
}

// MARK: 160. Intersection of Two Linked Lists
// https://leetcode.com/problems/intersection-of-two-linked-lists/
extension SolutionLeetQuestions {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        
        var aHead = headA
        var bHead = headB
        
        let lengthA = listLength(aHead!)
        let lengthB = listLength(bHead!)
        let diff = abs(lengthA - lengthB)
        
        if lengthA > lengthB {
            var count = 0
            while count < diff {
                aHead = aHead?.next
                count += 1
            }
        } else if lengthB > lengthA {
            var count = 0
            while count < diff {
                bHead = bHead?.next
                count += 1
            }
        }
        
        while aHead != nil || bHead != nil {
            if aHead === bHead {
                return bHead
            }
            
            aHead = aHead?.next
            bHead = bHead?.next
        }
        
        return nil
    }
    
    func listLength(_ val: ListNode) -> Int {
        var dist = 0
        var traversalNode: ListNode? = val
        
        while traversalNode != nil {
            dist += 1
            traversalNode = traversalNode?.next
        }
        
        return dist
    }
}


extension SolutionLeetQuestions {
    
}
