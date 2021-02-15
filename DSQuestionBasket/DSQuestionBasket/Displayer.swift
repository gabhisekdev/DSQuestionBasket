//
//  Displayer.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 27/10/20.
//  Copyright © 2020 Abhisek. All rights reserved.
//

import Foundation

func displayPrint(_ questionName: String, _ example: ()->Void) {
    print("__________________________")
    print(questionName)
    example()
    print("\n")
}
