//
//  longestSubArray.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/3/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation

func longestCharacter(input: String, distinct: Int, expect: Int) {
    var longestString: [String] = []
    var dict: [String: Int] = [:]
    var maxLength = 0
    var windowStart = 0
    for (windowEnd, character) in input.enumerated() {
        longestString.append(character.description)
        if !dict.keys.contains(character.description) {
            dict[character.description] = 0
        }
        dict[character.description]! += 1
        //Shrink the window
        while dict.keys.count > distinct {
            //Do not remove an item in longestString
            let shrinkCharacter = longestString[windowStart]
            dict[shrinkCharacter]! -= 1
            if dict[shrinkCharacter] == 0 {
                dict.removeValue(forKey: shrinkCharacter)
            }
            windowStart += 1
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    
    let resultInformation =
    #"""
    --- Function ---
    |🏀 \#(#function)
    |
    --- Input ------
    |👉 Input: \#(input)
    |👉 Distinct Size: \#(distinct)"
    |
    --- Output -----
    |🔥 Result: \#(maxLength)
    """#
    let testResult =
    #"""
    |
    --- Test -------
    \#(expect == maxLength ?
    "|😁 Success: Expected Result: \(expect), Result: \(maxLength)" :
    "|😭 Failed: Expected Result: \(expect), Result: \(maxLength)")
    ----------------
    """#
    print("\(resultInformation)\n\(testResult)")
}

/*
 Problem Statement
 Given an array of characters where each character represents a fruit tree, you are given two baskets and your goal is to put maximum number of fruits in each basket. The only restriction is that each basket can have only one type of fruit.

 You can start with any tree, but once you have started you can’t skip a tree. You will pick one fruit from each tree until you cannot, i.e., you will stop when you have to pick from a third fruit type.

 Write a function to return the maximum number of fruits in both the baskets. by Educative.io
 */

func fruitIntoBasket(input: [String]) -> Int {
    //fruit into two baskets
    var windowStart = 0
    var dict: [String: Int] = [:]
    let numberOfBasket = 2
    var maximumNumberOfFruits = 0
    for windowEnd in stride(from: 0, to: input.count, by: 1) {
        if dict[input[windowEnd]] == nil {
            dict[input[windowEnd]] = 0
        }
        dict[input[windowEnd]]! += 1
        while dict.keys.count > numberOfBasket {
            dict[input[windowStart]]! -= 1
            if dict[input[windowStart]] == 0 {
                dict.removeValue(forKey: input[windowStart])
            }
            //shrink the window
            windowStart += 1
        }
        //reduce is super slower than for loop
        var sumOfValue = 0
        for i in dict.values {
            sumOfValue += i
        }
        maximumNumberOfFruits = max(maximumNumberOfFruits, sumOfValue)
    }
    print("output: \(maximumNumberOfFruits)")
    return maximumNumberOfFruits
}
