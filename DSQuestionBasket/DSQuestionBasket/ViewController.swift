//
//  ViewController.swift
//  DSQuestionBasket
//
//  Created by G Abhisek on 21/12/19.
//  Copyright © 2019 G Abhisek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func testArrayQuestions() {
        let arrayToTest = [1, 3, 4, 6, 9, 12]
        print(arrayToTest.isThereAnyTriplets(for: 24))
    }

}

