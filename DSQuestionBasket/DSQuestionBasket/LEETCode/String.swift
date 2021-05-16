//
//  String.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 15/04/21.
//  Copyright © 2021 Abhisek. All rights reserved.
//

import Foundation

class SolutionString {
    func reverseString(_ s: inout [Character]) {
        if s.isEmpty {
            return
        }
        let char = s.removeFirst()
        reverseString(&s)
        s.append(char)
    }
}
