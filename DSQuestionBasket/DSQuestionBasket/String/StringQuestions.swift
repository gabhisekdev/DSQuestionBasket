//
//  StringQuestions.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 16/03/20.
//  Copyright © 2020 G Abhisek. All rights reserved.
//

import Foundation

struct StringQuestions {
    func reverseWordAnotherWay(_ testStr: String) -> [String] {
        var begin = testStr.count-1
        var end = testStr.count-1
        var reverseString: [String] = []
        
        while begin != 0 {
            if Array(testStr)[begin] == " " {
                while begin != end {
                    reverseString.insert(String(Array(testStr)[begin]), at: end-begin)
                }
                
                end = begin
            } else {
                begin-=1
            }
        }
        
        return reverseString
    }
}
