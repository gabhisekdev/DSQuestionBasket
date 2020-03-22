//
//  LinkedList.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 02/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }
}
