//
//  TreeNode.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 03/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: T) {
        self.value = value
    }
}


