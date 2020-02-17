//
//  FindHappyNumber.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/17/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation
func findHappyNumber(input: Int) -> Bool {
    var slow = input
    var fast = input
    while true {
        slow = squareSum(input: slow)
        fast = squareSum(input: squareSum(input: fast))
        print("findHappy slow:\(slow) fast:\(fast)")
        if slow == fast {
            break
        }
    }
    return slow == 1
}

func squareSum(input: Int) -> Int {
    var sum = 0
    var number = input
    while number > 0 {
        let digit = number % 10
        sum += digit * digit
        number = number / 10
    }
    return sum
}
