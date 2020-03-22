//
//  LinkedListQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 02/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

// Operations
extension LinkedList {
    func addNodeToFirst(element: T) {
        let newNode = Node(value: element)
        newNode.next = first
    }
    
    func addNodeToLast(element: T) {
        let newNode = Node(value: element)
        
        var currentNode = first
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = newNode
    }
    
    func addNode(data: T, after node: Node) {
        node.next = Node(value: data)
    }
}


// Questions
extension LinkedList {
    /* Given a singly linked list, find middle of the linked list. For example, if given linked list is 1->2->3->4->5 then output should be 3.

    If there are even nodes, then there would be two middle nodes, we need to print second middle element. For example, if given linked list is 1->2->3->4->5->6 then output should be 4. */
    
    func findMiddleElement() -> T? {
        var fastPointer = first
        var slowPointer = first
        
        if first == nil { return nil }
        
        while slowPointer?.next != nil {
            fastPointer = fastPointer?.next?.next
            slowPointer = slowPointer?.next
        }
        
        return slowPointer?.value
    }
}
