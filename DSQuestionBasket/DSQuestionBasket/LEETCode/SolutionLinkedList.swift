//
//  LinkedList.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 19/04/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class SolutionLinkedList {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let temp = ListNode(0)
        temp.next = head
        var curr: ListNode? = temp
        
        while curr?.next != nil && curr?.next?.next != nil {
            let firstNode = curr?.next
            let secondNode = curr?.next?.next
            firstNode?.next = secondNode?.next
            secondNode?.next = firstNode
            
            curr?.next = secondNode
            curr = firstNode
        }
        
        return temp.next
    }
    
    func swapPairsRecursively(_ head: ListNode?) -> ListNode? {
        let temp = ListNode(0)
        temp.next = head
        let curr: ListNode? = temp
        
        swapPairsRecursivelyHelper(curr)
        return temp.next
    }
    
    func swapPairsRecursivelyHelper(_ curr: ListNode?) {
        if curr?.next == nil || curr?.next?.next == nil {
            return
        }
        
        let firstNode = curr?.next
        let secondNode = curr?.next?.next
        firstNode?.next = secondNode?.next
        secondNode?.next = firstNode
        
        curr?.next = secondNode
        
        swapPairsRecursivelyHelper(firstNode)
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev = head
        var curr = head?.next
        prev?.next = nil
        
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev
    }
    
    func reverseListRecursively(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let reversedHeadNode = reverseListRecursively(head?.next)
        let next = head?.next
        next?.next = head
        head?.next = nil
        
        return reversedHeadNode
    }
}
